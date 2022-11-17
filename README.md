# Matomo Analytics Enterprise

Matomo Enterprise is the leading All-In-One digital analytics platform which includes Matomo Analytics and additional premium features such as [Heatmaps & Session Recording](https://plugins.matomo.org/HeatmapSessionRecording?pk_campaign=GithubMatomoEnterprise), [Search Keywords Performance](https://plugins.matomo.org/SearchEngineKeywordsPerformance?pk_campaign=GithubMatomoEnterprise), [A/B testing](http://www.ab-tests.net/?pk_campaign=GithubMatomoEnterprise), [Funnels](https://plugins.matomo.org/Funnels?pk_campaign=GithubMatomoEnterprise), [Users Flow](https://plugins.matomo.org/UsersFlow?pk_campaign=GithubMatomoEnterprise), [Roll-Up Reporting](https://plugins.matomo.org/RollUpReporting?pk_campaign=GithubMatomoEnterprise), [Form Analytics](https://www.form-analytics.net/?pk_campaign=GithubMatomoEnterprise), [Media Analytics](http://www.media-analytics.net/?pk_campaign=GithubMatomoEnterprise) and more outstanding products.

Matomo Enterprise is available both as:
- On-Premises solution where we support you and help setup your Matomo Enterprise solution on premises. Pricing includes Matomo Enterprise license + full support from the Matomo Analytics creators. [Learn more](https://matomo.org/support-plans/) or [contact us](https://matomo.org/enterprise-analytics/)
- Cloud solution (where we take care of everything and you still get 100% data ownership). Pricing for Cloud-hosted is displayed on http://matomo.org/pricing

Download the latest Matomo Enterprise release
=============================================

In this section we go through the three steps necessary to downloading the complete software packages for Matomo Analytics Enterprise. 

Requirements
------------

Note that for this script to successfully download Matomo Enterprise, you will need:

1.  Internet access to the following hostnames, which you may need to whitelist in your firewall or proxy:
  https://builds.matomo.org
  https://plugins.matomo.org

2.  The `curl` software to download files

Run the download script
-----------------------

To download Matomo enterprise, follow the steps:

1.  On your local machine, get our download script:

```
mkdir matomo-enterprise
cd matomo-enterprise
curl https://raw.githubusercontent.com/innocraft/matomo-enterprise/master/download-matomo-enterprise.sh > download-matomo-enterprise.sh
```
2.  Edit the script and in the first line, specify your license key.

3.  Make the script executable and run it:

```
chmod +x download-matomo-enterprise.sh
./download-matomo-enterprise.sh
```
4.  The script will automatically download the Matomo core platform, Matomo Enterprise premium plugins, and other recommended plugins.

Congratulations, you now have successfully downloaded your Matomo Analytics Enterprise package in the `src/` folder!


Support
=======

Learn more about Matomo On-Premise at: https://matomo.org/guide/installation-maintenance/matomo-on-premise-self-hosted/

All of Matomo Support available from https://matomo.org/help/
