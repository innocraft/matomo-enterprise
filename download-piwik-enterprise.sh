LICENSE_KEY="Put your Piwik Marketplace license key here. Get it @ https://shop.piwik.org/my-account/"

mkdir "src" || { echo "Please delete the directory src/ before proceeding. Piwik Enterprise will be extracted in this directory." ; exit; }

PLUGINS_TO_DOWNLOAD="CustomDimensions CustomReports MarketingCampaignsReporting CustomAlerts LogViewer InvalidateReports TasksTimetable AbTesting MediaAnalytics FormAnalytics Funnels RollUpReporting SearchEngineKeywordsPerformance HeatmapSessionRecording UsersFlow ActivityLog WhiteLabel"

for PLUGIN_NAME in $PLUGINS_TO_DOWNLOAD
do
    echo "Downloading plugin $PLUGIN_NAME..."
    if curl -f -sS --data "access_token=$LICENSE_KEY" https://plugins.piwik.org/api/2.0/plugins/$PLUGIN_NAME/download/latest > plugins-$PLUGIN_NAME.zip; then
        echo "OK"
    else
        echo -e "Please check your Piwik Marketplace license key is correct, and try again." >&2
        exit 1
    fi;
done;

echo -e "Downloading the Piwik Analytics platform..."
curl https://builds.piwik.org/piwik.zip > piwik.zip

echo -e "Extract all packages in the src/ directory..."

unzip -q -o piwik.zip -d src/
mv src/piwik/* src/
rmdir src/piwik/
rm src/How\ to\ install\ Piwik.html

for PLUGIN_NAME in $PLUGINS_TO_DOWNLOAD
do
    unzip -q -o plugins-$PLUGIN_NAME -d src/plugins/
done;

echo -e "Done extracting files!\nPiwik Enterprise is packaged in src/"
