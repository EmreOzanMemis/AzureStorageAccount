#!/bin/bash

# Parametrelerin tanımlanması
resourceGroupName="myResourceGroup"
location="EastUS"
storageAccountName="mystorageaccount$(date +%s)"  # Benzersiz bir ad için zaman damgası
sku="Standard_LRS"  # Depolama SKU'su
kind="StorageV2"  # Depolama türü (Storage, StorageV2, BlobStorage)
accessTier="Hot"  # Erişim katmanı: Hot, Cool veya Archive

# Resource Group oluşturulması
az group create --name $resourceGroupName --location $location

# Storage Account oluşturulması
az storage account create \
  --name $storageAccountName \
  --resource-group $resourceGroupName \
  --location $location \
  --sku $sku \
  --kind $kind \
  --access-tier $accessTier

echo "Azure Storage Account başarıyla oluşturuldu: $storageAccountName"

# Storage Account'un katmanını değiştirmek için (isteğe bağlı)
# Erişim katmanını değiştirme: Hot, Cool veya Archive
newAccessTier="Cool"  # Yeni katman

# Eğer isteğe bağlı olarak katmanı değiştirmek isterseniz
az storage account update \
  --name $storageAccountName \
  --resource-group $resourceGroupName \
  --access-tier $newAccessTier

echo "Erişim katmanı başarıyla değiştirildi: $newAccessTier"
