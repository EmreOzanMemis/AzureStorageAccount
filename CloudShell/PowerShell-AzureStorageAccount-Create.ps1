# Parametrelerin doğrulanması
function Validate-Parameters {
    param(
        [string]$SubscriptionId,
        [string]$ResourceGroupName,
        [string]$StorageAccountName,
        [string]$Region,
        [string]$Performance,
        [string]$Redundancy,
        [string]$AccessTier,
        [bool]$EnablePublicAccess,
        [hashtable]$Tags
    )
    
    if (-not $SubscriptionId) { throw "SubscriptionId is required." }
    if (-not $ResourceGroupName) { throw "ResourceGroupName is required." }
    if (-not $StorageAccountName -or $StorageAccountName.Length -lt 3 -or $StorageAccountName.Length -gt 24) { 
        throw "StorageAccountName is required and must be between 3 and 24 characters." 
    }
    if (-not $Region) { throw "Region is required." }
    if (-not $Performance -or ($Performance -ne "Standard" -and $Performance -ne "Premium")) { 
        throw "Performance must be 'Standard' or 'Premium'." 
    }
    if (-not $Redundancy) { throw "Redundancy is required." }
    if (-not $AccessTier -or ($AccessTier -ne "Hot" -and $AccessTier -ne "Cool")) { 
        throw "AccessTier must be 'Hot' or 'Cool'." 
    }
}

# Parametre tanımları
$subscriptionId = "your_subscription_id"
$resourceGroupName = "your_resource_group_name"
$storageAccountName = "your_storage_account_name"
$region = "eastus"
$performance = "Standard"
$redundancy = "LRS"
$accessTier = "Hot"
$enablePublicAccess = $true
$tags = @{"Project" = "YourProject"; "Environment" = "Production"}

# Parametrelerin doğrulanması
Validate-Parameters -SubscriptionId $subscriptionId -ResourceGroupName $resourceGroupName -StorageAccountName $storageAccountName -Region $region -Performance $performance -Redundancy $redundancy -AccessTier $accessTier -EnablePublicAccess $enablePublicAccess -Tags $tags

try {
    # Aboneliğe geçiş yap
    $subscription = Get-AzSubscription -SubscriptionId $subscriptionId
    Set-AzContext -SubscriptionId $subscription.Id

    # Kaynak Grubunu oluştur veya mevcutsa atla
    if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
        New-AzResourceGroup -Name $resourceGroupName -Location $region
        Write-Output "Resource group '$resourceGroupName' created successfully in region '$region'."
    } else {
        Write-Output "Resource group '$resourceGroupName' already exists. Skipping creation."
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
}
catch {
    Write-Error "An error occurred: $_"
}
