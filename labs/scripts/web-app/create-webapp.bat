REM Run Azure CLI 

export RESOURCE_GROUP=learn-4e18e730-c221-430b-bc4e-6feac0b20082
export AZURE_REGION=centralus
export AZURE_APP_PLAN=popupappplan-$RANDOM
export AZURE_WEB_APP=popupwebapp-$RANDOM


REM Create app service plan

az appservice plan create --name $AZURE_APP_PLAN --resource-group $RESOURCE_GROUP --location $AZURE_REGION --sku FREE

REM Create Web App
az webapp create --name $AZURE_WEB_APP --resource-group $RESOURCE_GROUP --plan $AZURE_APP_PLAN

REM Access Web app  
curl $AZURE_WEB_APP.azurewebsites.net

REM Deploy Source Code from GitHub to our Web App
az webapp deployment source config --name $AZURE_WEB_APP --resource-group $RESOURCE_GROUP --repo-url "https://github.com/Azure-Samples/php-docs-hello-world" --branch master --manual-integration

REM Access site again 
curl $AZURE_WEB_APP.azurewebsites.net