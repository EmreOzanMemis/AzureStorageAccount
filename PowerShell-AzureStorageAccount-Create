$subscriptionId = "your_subscription_id"             # Azure abonelik ID'nizi buraya ekleyin
$resourceGroupName = "your_resource_group_name"      # Kaynak Grubu adı
$storageAccountName = "your_storage_account_name"    # Benzersiz Storage Account adı
$region = "eastus"                                   # Bölge, örneğin "eastus", "westeurope"
$performance = "Standard"                            # Performans: "Standard" veya "Premium"
$redundancy = "LRS"                                  # Yedekleme: "LRS", "GRS", "ZRS" vb.
$accessTier = "Hot"                                  # Erişim Katmanı: "Hot" veya "Cool"
$enablePublicAccess = $true                          # Ağ Erişimi: Tüm ağlardan genel erişimi etkinleştir
$tags = @{"Project" = "YourProject"; "Environment" = "Production"}

# Aboneliğe geçiş yap
$subscription = Get-AzSubscription -SubscriptionName $subscriptionName
Set-AzContext -SubscriptionId $subscription.Id

# Kaynak Grubunu oluştur veya mevcutsa atla
if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $resourceGroupName -Location $region
}

# Storage Account'ı oluştur
$storageAccountParams = @{
    ResourceGroupName = $resourceGroupName
    Name              = $storageAccountName
    Location          = $region
    SkuName           = "Standard_" + $redundancy
    Kind              = "StorageV2"
    AccessTier        = $accessTier
    EnableHttpsTrafficOnly = $true
    AllowBlobPublicAccess  = $enablePublicAccess
    Tags = $tags
}

New-AzStorageAccount @storageAccountParams

Write-Output "Storage account '$storageAccountName' has been created successfully in region '$region'."
