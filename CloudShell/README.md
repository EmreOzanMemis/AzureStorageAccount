# PowerShell ile Azure Storage Account oluşturma
Bu PowerShell betiği, Azure'da bir Storage Account (Depolama Hesabı) oluşturmak için kullanılır. Her bir parametrenin amacı ve işlevi aşağıda açıklanmıştır.

Azure PowerShell modülü yüklü değilse, yükleyin:
`Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force`

Azure PowerShell modülüne bağlanın ve oturum açın
`Connect-AzAccount`

Parametre Açıklamaları

  `$subscriptionId`: Azure abonelik kimliğinizi belirtir. Storage Account'un hangi abonelik altında oluşturulacağını tanımlar.
  `$resourceGroupName`: Depolama hesabının ait olduğu kaynak grubunun adı. Kaynak grupları, birden çok Azure kaynağını düzenlemek ve yönetmek için kullanılır.
  `$storageAccountName`: Storage Account'un benzersiz bir adı. Azure genelinde benzersiz olması gerekir. Genellikle "sa-" gibi bir önekle başlar.
  `$region`: Storage Account'un oluşturulacağı coğrafi bölge. Örneğin, "eastus" veya "westeurope". Kullanıcıların çoğunluğuna yakın bir bölge seçmek, erişim hızını ve performansını artırabilir.
  `$performance`: Storage Account'un performans seviyesi. "Standard" veya "Premium" olarak seçilebilir. Standart depolama, HDD tabanlıdır ve maliyet açısından daha uygundur; Premium depolama ise SSD tabanlıdır ve yüksek performans gerektiren uygulamalar için kullanılır.
  `$redundancy`: Yedekleme türünü belirtir. Verilerin kaybını önlemek için kullanılan farklı yedekleme türleri:
        LRS (Locally Redundant Storage): Verileri aynı veri merkezinde üç kopya olarak saklar.
        GRS (Geo-Redundant Storage): Verileri, birincil ve ikincil veri merkezlerinde coğrafi olarak yedekli saklar.
        ZRS (Zone-Redundant Storage): Verileri, farklı kullanılabilirlik bölgelerinde (availability zones) saklar.
  `$accessTier`: Blob depolama için erişim katmanı.
        Hot: Sık erişilen veriler için, yüksek maliyetli depolama.
        Cool: Daha az erişilen veriler için, düşük maliyetli depolama.
  `$enablePublicAccess`: Tüm ağlardan veya yalnızca belirli ağlardan genel erişimi etkinleştirmek için kullanılır. Bu örnekte, $true olarak ayarlanmış ve tüm ağlardan erişimi etkinleştirir.
  `$tags`: Depolama hesabına eklenen ek bilgi etiketleri. Bu etiketler, hesapların kategorize edilmesi ve maliyet takibi gibi işlevler için kullanılır.

Betik Açıklaması

  Aboneliğe Geçiş:
        $subscriptionName kullanılarak Azure aboneliği seçilir ve `Set-AzContext` komutuyla bu abonelikte işlem yapılması sağlanır.

  Kaynak Grubu Oluşturma:
        `Get-AzResourceGroup` komutu ile belirtilen kaynak grubunun varlığı kontrol edilir. Yoksa, `New-AzResourceGroup` ile belirtilen bölgede yeni bir kaynak grubu oluşturulur.

  Storage Account Oluşturma:
        `$storageAccountParams` sözlüğü, Storage Account'un nasıl yapılandırılacağını belirten tüm parametreleri içerir. `New-AzStorageAccount` komutu ile Storage Account oluşturulur.

  Sonuç Mesajı:
        `Write-Output` komutuyla oluşturulan Storage Account ve bölge hakkında bilgi veren bir mesaj görüntülenir.

Neden Kullanılır?

  Veri Depolama: Farklı veri türlerini (Blob, Dosya, Kuyruk, Tablo) güvenilir, ölçeklenebilir ve uygun maliyetle depolamak için Storage Account kullanılır.
  Organizasyon ve Güvenlik: Kaynak grupları ve etiketlerle organize edilirken, ağ erişimi ve yedekleme gibi ayarlar da güvenlik sağlar.
  Otomasyon: PowerShell gibi betikler, manuel işlem yapmadan depolama hesaplarının otomatik olarak oluşturulmasına ve yapılandırılmasına olanak tanır.

Bu script, depolama hesaplarınızı Azure'da kolay ve hızlı bir şekilde oluşturmak ve ihtiyaçlarınıza göre yapılandırmak için kullanılabilir.

#Örnek Kullanım
```
$subscriptionName = "Microsoft Azure Sponsorluk"         # Azure abonelik adı
$resourceGroupName = "RG-Storage-Account-Test"           # Kaynak Grubu adı
$storageAccountName = "saeom"                            # Storage Account adı
$region = "westeurope"                                   # Bölge
$performance = "Standard"                                # Performans: "Standard"
$redundancy = "LRS"                                      # Yedekleme: "LRS" (Lokal Yedekli Depolama)
$accessTier = "Hot"                                      # Erişim Katmanı: "Hot"
$enablePublicAccess = $true                              # Ağ Erişimi: Tüm ağlardan genel erişimi etkinleştir
$tags = @{"Project" = "EOM"}                             # Tag'ler

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
```
#CloudShell Örnek Ekran Görüntüsü

![image](https://github.com/EmreOzanMemis/AzureStorageAccount/assets/63871298/e5bf853b-4735-40cd-9df4-0448b4487616)

