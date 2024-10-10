#!/bin/bash

# Kullanıcıdan dinamik parametreler alalım
read -p "Resource Group Name: " resourceGroupName
read -p "Location (e.g., EastUS, WestEurope): " location
read -p "Storage Account Name: " storageAccountName
read -p "SKU (e.g., Standard_LRS, Premium_LRS): " sku
read -p "Storage Account Kind (Storage, StorageV2, BlobStorage): " kind
read -p "Access Tier (Hot, Cool, Archive): " accessTier

# Eğer depolama hesabı adı boş bırakıldıysa benzersiz bir ad üretelim
if [ -z "$storageAccountName" ]; then
  storageAccountName="mystorageaccount$(date +%s)"  # Benzersiz bir ad üret
fi

# Resource Group'un var olup olmadığını kontrol et, yoksa oluştur
if ! az group show --name $resourceGroupName &>/dev/null; then
  echo "Resource Group '$resourceGroupName' mevcut değil. Oluşturuluyor..."
  az group create --name $resourceGroupName --location $location
  if [ $? -ne 0 ]; then
    echo "Hata: Resource Group oluşturulamadı!"
    exit 1
  fi
  echo "Resource Group başarıyla oluşturuldu."
else
  echo "Resource Group '$resourceGroupName' zaten mevcut."
fi

# Storage Account'un var olup olmadığını kontrol et, yoksa oluştur
if ! az storage account show --name $storageAccountName --resource-group $resourceGroupName &>/dev/null; then
  echo "Storage Account '$storageAccountName' oluşturuluyor..."
  az storage account create \
    --name $storageAccountName \
    --resource-group $resourceGroupName \
    --location $location \
    --sku $sku \
    --kind $kind \
    --access-tier $accessTier
  if [ $? -ne 0 ]; then
    echo "Hata: Storage Account oluşturulamadı!"
    exit 1
  fi
  echo "Azure Storage Account başarıyla oluşturuldu: $storageAccountName"
else
  echo "Storage Account '$storageAccountName' zaten mevcut."
fi

# Storage Account Bilgilerini Getir
echo "Depolama Hesabı Detayları:"
az storage account show --name $storageAccountName --resource-group $resourceGroupName --query "{Name:name, Location:primaryLocation, SKU:sku.name, AccessTier:accessTier}" -o table

# Erişim katmanını değiştirme seçeneği
read -p "Erişim katmanını değiştirmek ister misiniz? (y/n): " changeTier
if [[ "$changeTier" == "y" ]]; then
  read -p "Yeni erişim katmanı (Hot, Cool, Archive): " newAccessTier
  az storage account update \
    --name $storageAccountName \
    --resource-group $resourceGroupName \
    --access-tier $newAccessTier
  if [ $? -ne 0 ]; then
    echo "Hata: Erişim katmanı değiştirilemedi!"
    exit 1
  fi
  echo "Erişim katmanı başarıyla değiştirildi: $newAccessTier"
fi

echo "İşlem tamamlandı!"
