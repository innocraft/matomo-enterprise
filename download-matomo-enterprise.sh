# Put your Matomo Marketplace license key in the double quotes below.
# Get your license key @ https://shop.matomo.org/my-account/
LICENSE_KEY=""

if [ -z "$LICENSE_KEY" ]
  then
    echo -e "Please check your Matomo Marketplace license key is correct, and try again." >&2
    exit 1
fi

mkdir "src" || { echo "Please delete the directory src/ before proceeding. Matomo Enterprise will be extracted in this directory." ; exit; }

if [ -z "$1" ]
  then
    MATOMO_CORE_VERSION=$(curl -f -sS https://api.matomo.org/1.0/getLatestVersion/) || die "Failed to fetch the latest Matomo version."
    echo -e "No version supplied, building the latest stable $MATOMO_CORE_VERSION..."
  else
    MATOMO_CORE_VERSION=$1
fi

function die() {
	echo -e "$0: $1"
	exit 2
}

MATOMO_CORE_NAME="matomo-$MATOMO_CORE_VERSION.zip"
MATOMO_CORE_DOWNLOAD="https://builds.matomo.org/$MATOMO_CORE_NAME"
echo -e "Downloading the Matomo Analytics platform from $MATOMO_CORE_DOWNLOAD..."
curl --fail $MATOMO_CORE_DOWNLOAD > $MATOMO_CORE_NAME || die "Failed to download at this URL!"

PLUGINS_TO_DOWNLOAD="CustomDimensions CustomReports MarketingCampaignsReporting CustomAlerts LogViewer InvalidateReports TasksTimetable QueuedTracking AbTesting MediaAnalytics FormAnalytics Funnels RollUpReporting SearchEngineKeywordsPerformance MultiChannelConversionAttribution HeatmapSessionRecording UsersFlow ActivityLog WhiteLabel Cohorts"

for PLUGIN_NAME in $PLUGINS_TO_DOWNLOAD
do
    echo "Downloading plugin $PLUGIN_NAME..."
    if curl -f -sS --data "access_token=$LICENSE_KEY" https://plugins.matomo.org/api/2.0/plugins/$PLUGIN_NAME/download/latest?matomo=$MATOMO_CORE_VERSION > plugins-$PLUGIN_NAME.zip; then
        echo "OK"
    else
        echo -e "Please check your Matomo Marketplace license key is correct, and try again." >&2
        exit 1
    fi;
done;

echo -e "Extract all packages in the src/ directory..."

unzip -q -o $MATOMO_CORE_NAME -d src/
mv src/matomo/* src/
rmdir src/matomo/

for PLUGIN_NAME in $PLUGINS_TO_DOWNLOAD
do
    unzip -q -o plugins-$PLUGIN_NAME -d src/plugins/
done;

echo -e "Done extracting files!\nMatomo Enterprise is packaged in src/"
