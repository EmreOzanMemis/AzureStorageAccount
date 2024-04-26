# AzureStorageAccount

Azure Storage, Microsoft Azure üzerinde veri depolamak için kullanılan geniş kapsamlı bir servistir. Bu servis, farklı türdeki verileri güvenli, ölçeklenebilir ve erişilebilir bir şekilde saklamanıza olanak tanır. Azure Storage, birkaç ana bileşenden oluşur:

  Blob Storage: "Blob" (Binary Large Object), büyük miktarda veriyi depolamak için kullanılır. Fotoğraflar, video dosyaları, ses dosyaları ve diğer büyük medya dosyaları için idealdir. Blob Storage, verileri düzenlemek için kapsayıcılar (container) ve bloblar olarak iki düzeyde depolar.

  File Storage: Azure File Storage, bulutta SMB protokolü aracılığıyla erişilebilen paylaşılan dosya sistemleri sağlar. Bu, yerel ağ dosya paylaşımlarına benzer bir kullanım sunarak, bulut ve yerel sistemler arasında kolay bir entegrasyon sağlar.

  Queue Storage: Mesaj kuyruklama servisi olan Queue Storage, bileşenler arası veya uygulamalar arası iletişimde kullanılır. Uygulamaların birbirleriyle asenkron olarak haberleşmesine olanak tanır.

  Table Storage: Yapılandırılmış verileri, NoSQL tabanlı bir hizmet olan Table Storage ile depolayabilirsiniz. Büyük ölçüde ölçeklenebilen bu hizmet, geniş veri setleri üzerinde hızlı erişim ve sorgulama imkanı sunar.

  Disk Storage: Azure sanal makineleri için disk depolama çözümüdür. SSD ve HDD seçenekleri mevcuttur ve yüksek I/O performansı gerektiren uygulamalar için idealdir.

Azure Storage'ın güçlü yönlerinden biri de dayanıklılık ve yüksek erişilebilirliktir. Veriler, fiziksel olarak izole edilmiş birden fazla veri merkezine otomatik olarak kopyalanır. Bu, veri kaybı riskini azaltır ve sürekli erişim sağlar.

Azure Storage, REST API ve SDK'lar aracılığıyla programatik olarak yönetilebilir ve çeşitli programlama dilleri ile entegre edilebilir. Güvenlik açısından, veri şifreleme ve erişim kontrolü gibi özellikler ile verilerinizi korur.

Bu servislerin her biri, farklı veri depolama ve yönetim ihtiyaçlarına göre özelleştirilebilir ve çeşitli uygulama senaryolarında kullanılabilir.

# Azure Storage Account kurulumu yaparken dikkat edilmesi gereken birkaç önemli nokta bulunmaktadır.
Bu adımlar, hem güvenlik hem de performans açısından en uygun konfigürasyonu sağlamak için önemlidir:

  Bölge Seçimi: Storage Account'ınızı oluştururken verilerinizin depolanacağı bölgeyi seçmek önemlidir. Genellikle, kullanıcılarınıza en yakın bölgeyi seçmek, daha düşük gecikme süreleri ve daha hızlı erişim sağlar. Ayrıca, veri egemenliği ve yasal gereklilikler gibi faktörler de bölge seçiminde etkili olabilir.

  Performans Katmanı Seçimi: Azure Storage, standart ve premium olmak üzere iki performans katmanı sunar. Premium katman, SSD tabanlı diskler üzerinde çalışarak daha yüksek I/O performansı sağlar. Uygulamanızın gereksinimlerine göre uygun olanı seçmelisiniz.

  Erişim Katmanı: Blob Storage için farklı erişim katmanları bulunur: Hot, Cool ve Archive. Her biri, verilerin ne sıklıkla erişildiğine ve depolama süresine bağlı olarak maliyet ve performans açısından farklı avantajlar sunar. Sık erişilen veriler için "Hot", daha az erişilen ancak gerektiğinde hızlıca erişilmesi gereken veriler için "Cool" ve nadiren erişilen, uzun süreli depolama için "Archive" katmanlarını değerlendirebilirsiniz.

  Yeniden Silme Koruması: Yanlışlıkla veya kötü niyetli eylemler sonucunda veri kaybını önlemek için yeniden silme korumasını etkinleştirmek önemlidir. Bu özellik, belirlenen süre boyunca verilerin silinmesini veya üzerine yazılmasını engeller.

  Şifreleme: Azure Storage, verilerinizi hem istirahat halindeyken (Azure Storage Service Encryption) hem de iletim sırasında (HTTPS üzerinden) şifreleyerek güvenliğini sağlar. İlave olarak, kendi şifreleme anahtarlarınızı kullanmak isterseniz, Azure Key Vault ile entegrasyon yapabilirsiniz.

  Ağ Güvenliği: Azure Storage hesabınıza erişimi kontrol etmek için sanal ağlar ve güvenlik grupları kullanabilirsiniz. Ayrıca, belirli IP adresleri veya IP adres aralıkları için erişim kısıtlamaları ayarlayarak güvenliği artırabilirsiniz.

  Erişim İlkeleri ve Rol Tabanlı Erişim Kontrolü (RBAC): Verilere kimlerin erişebileceğini kontrol etmek için erişim ilkeleri ve RBAC ayarlarını kullanın. Bu, yalnızca yetkilendirilmiş kullanıcıların veya uygulamaların verilerinize erişmesini sağlar.

  Yedekleme ve Kurtarma: Veri kaybına karşı korunmak için düzenli yedeklemeler yapın ve veri kurtarma stratejilerinizi belirleyin. Azure, bazı durumlarda otomatik snapshot ve geo-redundant depolama çözümleri sunarak bu süreci destekler.

Bu adımları dikkate alarak, Azure Storage Account'unuzu hem güvenli hem de ihtiyaçlarınıza uygun bir şekilde yapılandırabilirsiniz.

# Azure Blob Storage
Azure Blob Storage hesabı oluşturmak ve kullanmaya başlamak için adım adım bir rehber aşağıda sıralanmıştır. Bu işlemleri Azure Portal üzerinden gerçekleştirebilirsiniz:
1. Azure Portal'a Giriş Yapın

Azure Portal'a (portal.azure.com) Microsoft hesabınız ile giriş yapın.
2. Storage Account Oluşturun

Portalın sol üst köşesindeki "Create a resource" (Kaynak oluştur) butonuna tıklayın.

"Storage" kategorisini seçin ve ardından "Storage account" seçeneğine tıklayın.

  Açılan formda gerekli bilgileri doldurun:
        Subscription: Kullanmak istediğiniz Azure aboneliğini seçin.
        Resource group: Bir kaynak grubu seçin veya yeni bir tane oluşturun. Kaynak grupları, Azure kaynaklarınızı organize etmenize yardımcı olur.
        Storage account name: Storage hesabınız için benzersiz bir isim girin.
        Location: Verilerinizin depolanacağı coğrafi konumu seçin.
        Performance: "Standard" veya "Premium" performans seviyelerinden birini seçin.
        Account kind: Burada "StorageV2 (general purpose v2)" seçeneğini tercih edebilirsiniz çünkü en yeni özellikleri destekler.
        Replication: Verilerinizin korunma düzeyini seçin (örneğin, LRS - Lokal Yedekli Depolama, GRS - Coğrafi Yedekli Depolama vb.).
        Access tier (default): Varsayılan erişim katmanını "Hot" veya "Cool" olarak belirleyin.

  "Review + create" butonuna tıklayarak bilgileri gözden geçirin ve "Create" (Oluştur) butonuyla hesabınızı oluşturun.

3. Blob Service'i Kullanmaya Başlayın

Storage hesabınız oluşturulduktan sonra Blob Service'i kullanmaya başlamak için şu adımları izleyin:

  Azure Portal'da oluşturduğunuz Storage Account sayfasına gidin.
    "Blob service" sekmesini bulun ve "Containers" (Kapsayıcılar) seçeneğine tıklayın.
    "Container" oluşturmak için "+ Container" butonuna tıklayın ve bir isim verin. Erişim düzeyini ("Private", "Blob", "Container") belirleyerek kapsayıcınızın gizlilik seviyesini ayarlayın.
    Oluşturulan kapsayıcıya dosya yüklemek için, kapsayıcıya gidin ve "Upload" (Yükle) butonuna tıklayın, yüklemek istediğiniz dosyaları seçin.

4. Azure SDK veya CLI Kullanarak Erişim

Azure Blob Storage'a programatik olarak erişmek için Azure SDK'larını (Python, .NET, Java vb.) veya Azure CLI kullanabilirsiniz. SDK'lar, Blob Storage ile etkileşim kurmanızı sağlayan metodlar sunar.

Bu adımlarla, Azure Blob Storage hesabınızı başarıyla kurmuş olursunuz ve Blob'larınızı yükleyip yönetmeye başlayabilirsiniz. Her adımda, güvenlik ve maliyet optimizasyonunu göz önünde bulundurmanız önemlidir.

Blob Storage için SDK'ları Nereden Temin Edebilirim?

Azure Blob Storage için SDK'lar, çeşitli programlama dilleri için resmi olarak Microsoft tarafından sağlanmaktadır. SDK'ları temin etmek için:

  Resmi Microsoft Dokümantasyonu: Azure'un resmi dokümantasyon sayfası üzerinden ilgili programlama diline uygun SDK'ları bulabilirsiniz.
  Programlama Dili Paket Yöneticileri:
        Python için: pip install azure-storage-blob
        .NET için: NuGet paket yöneticisinde Azure.Storage.Blobs
        Java için: Maven deposunda com.azure:azure-storage-blob
        JavaScript/Node.js için: npm install @azure/storage-blob
  GitHub: SDK'ların kaynak kodlarına ve örneklerine Microsoft'un GitHub sayfasından ulaşabilirsiniz.

Her dil için SDK'nın en güncel versiyonunu kullanmanız, en iyi performansı ve güvenlik özelliklerini garanti altına alır. SDK'lar ile programatik olarak verilerinizi yönetmek, yüklemek, indirmek ve güvenlik ayarlarını yapılandırmak mümkündür.

# Azure Queue Storage

Azure Queue Storage, uygulamalar arası mesaj iletişimi için kullanılan bir hizmettir ve asenkron görevleri veya işlemleri yönetmek için idealdir. Azure Queue Storage kullanarak uygulamalarınız arasında mesajlar gönderebilir ve alabilirsiniz. İşte Azure Queue Storage kullanımına dair bir rehber:
1. Azure Portal'da Queue Storage Oluşturma

    Azure Portal'a Giriş Yapın: Azure Portal adresine giderek oturum açın.
    Storage Account Oluşturun: Yeni bir Storage Account oluşturmak için "Create a resource" > "Storage" > "Storage account" yolunu izleyin. Daha önceden oluşturulmuş bir hesabınız varsa, onu kullanabilirsiniz.
    Queue Service'e Gidin: Oluşturduğunuz ya da mevcut Storage Account sayfasına gidin ve "Queue service" bölümünü açın.
    Yeni Queue Oluşturun: "Queue" sekmesine giderek "+ Queue" butonu ile yeni bir queue oluşturun. Queue'ya bir isim verin. Bu isim, queue ile etkileşimde bulunurken kullanılacaktır.

2. Azure SDK Kullanarak Queue İle Etkileşim

Azure Queue Storage ile etkileşimde bulunmak için çeşitli SDK'lar kullanabilirsiniz. İşte bazı yaygın programlama dilleri için SDK kullanım örnekleri:
Python ile Queue Kullanımı:

Python için Azure SDK'sını yüklemek için:

`pip install azure-storage-queue`

Queue'dan mesaj göndermek ve almak için basit bir Python scripti:

```
from azure.storage.queue import QueueServiceClient, QueueClient
# Bağlantı dizesi ile Queue Service Client oluştur
connect_str = 'your_connection_string'
queue_service_client = QueueServiceClient.from_connection_string(connect_str)

# Queue'ya bağlan veya oluştur
queue_client = queue_service_client.get_queue_client(queue="your_queue_name")

# Queue'ya mesaj ekle
queue_client.send_message(u"Hello, World!")

# Queue'dan mesaj al
messages = queue_client.receive_messages()
for msg in messages:
    print(msg.content)
    # Mesajı işlemden sonra sil
    queue_client.delete_message(msg)
```
.NET ile Queue Kullanımı:

.NET için SDK'yı yüklemek için NuGet paket yöneticisinde Azure.Storage.Queues paketini kullanabilirsiniz.

Queue ile etkileşimde bulunacak basit bir .NET örneği:

```
using Azure.Storage.Queues; // Namespace for Queue storage types
using Azure.Storage.Queues.Models; // Namespace for PeekedMessage

// Bağlantı dizesi ile Queue Client oluştur
string connectionString = "your_connection_string";
QueueClient queueClient = new QueueClient(connectionString, "your_queue_name");

// Queue'ya mesaj gönder
queueClient.SendMessage("Hello, World!");

// Queue'dan mesaj al ve sil
QueueMessage[] retrievedMessage = queueClient.ReceiveMessages();
queueClient.DeleteMessage(retrievedMessage[0].MessageId, retrievedMessage[0].PopReceipt);
```
3. Güvenlik ve İzin Ayarları

Azure Portal üzerinden veya Azure CLI/PowerShell kullanarak queue'lara erişim izinlerini yönetebilirsiniz. Güvenlik ve erişim politikalarını düzenlemek, sadece belirli kullanıcıların veya hizmetlerin mesajları okuyup yazabilmesini sağlar.

Azure Queue Storage kullanarak, farklı bileşenler arasında güvenli ve etkili bir şekilde asenkron mesajlaşma yapabilirsiniz. İşlemleri ölçeklendirme ve yönetme kapasitenizi artırırken, uygulamanızın performansını da optimize eder.

# Azure TAble Storage
Azure Table Storage kurulumu, Azure Storage hesabı içinde yapılır ve bu süreç, genel olarak Azure Portal üzerinden kolaylıkla gerçekleştirilebilir. Aşağıda, Azure Table Storage kullanmaya başlamak için gereken adımlar sıralanmıştır:
1. Azure Portal'a Giriş Yapın

Öncelikle, Azure Portal adresine giderek Microsoft hesabınızla oturum açın.
2. Storage Account Oluşturun

Eğer mevcut bir Storage Account'unuz yoksa, yeni bir tane oluşturmanız gerekecek:

  Portalın sol üst köşesindeki "Create a resource" (Kaynak oluştur) butonuna tıklayın.
    "Storage" kategorisini seçin ve ardından "Storage account" seçeneğine tıklayın.
    Açılan formda, abonelik ve kaynak grubu seçin, storage account için bir ad girin ve konum belirleyin.
    Performance seçeneğini "Standard" olarak belirleyin (Table Storage için "Premium" seçeneği gerekli değildir).
    Account kind olarak "StorageV2 (general purpose v2)" seçeneğini belirleyin çünkü bu en yeni özellikleri destekler ve table storage'ı da içerir.
    İhtiyacınıza uygun replikasyon ve erişim katmanı seçeneklerini belirleyin.
    "Review + create" butonuna tıklayarak bilgileri gözden geçirin ve "Create" (Oluştur) butonuyla hesabınızı oluşturun.

3. Table Storage Kullanmaya Başlayın

Storage account oluşturduktan sonra, Table Storage servisini kullanmaya başlayabilirsiniz:

  Azure Portal'da, oluşturduğunuz Storage Account sayfasına gidin.
    Sol menüde "Table service" seçeneğini bulun ve "Tables" altında yeni bir table oluşturun.
    "+ Table" butonuna tıklayarak yeni bir table oluşturun ve table'a bir isim verin.

4. Table'ınıza Veri Ekleyin ve Yönetin

Table oluşturduktan sonra, veri eklemek ve yönetmek için Azure Portal'ı veya Azure Storage Explorer'ı kullanabilirsiniz. Ayrıca, çeşitli SDK'lar aracılığıyla programatik olarak da veri ekleyip yönetebilirsiniz. Örneğin, C#, Java, Python veya Node.js gibi diller için Azure SDK'larını kullanabilirsiniz.

SDK Kullanarak Azure Table Storage ile Çalışmak

Azure SDK'ları kullanarak Azure Table Storage ile çalışmak için ilgili SDK'yı yüklemeniz gerekecek. Python için bir örnek:

`pip install azure-data-tables`

Ve Python ile basit bir veri ekleme örneği:

```
from azure.data.tables import TableServiceClient

connection_string = "Your_Connection_String"
table_service = TableServiceClient.from_connection_string(conn_str=connection_string)
table_client = table_service.get_table_client(table_name="Your_Table_Name")

entity = {
    "PartitionKey": "TestPartition",
    "RowKey": "001",
    "Name": "Example Name",
    "Value": 100
}

table_client.create_entity(entity=entity)
```
Bu örnekte, TableServiceClient kullanılarak belirli bir table'a yeni bir entity eklenmektedir.

Bu adımlarla, Azure Table Storage kullanımına başlamış olursunuz. Verilerinizi düzenli bir şekilde saklayabilir, kolayca erişebilir ve yönetebilirsiniz.

# Azure File Storage

Azure File Storage, Microsoft Azure'da paylaşılan dosya depolama hizmetidir ve Server Message Block (SMB) protokolünü kullanarak, dosyalarınizi bulut üzerinde sanal bir dosya sunucusu gibi saklamanıza ve yönetmenize olanak tanır. Azure File Storage'ın temel kullanım alanları ve kullanım nedenlerini aşağıda detaylandırdım:
Kullanım Alanları

  Uygulama Dosya Paylaşımları:
        Uygulamaların bulut üzerinde çalışırken dosya tabanlı verilere erişimini sağlamak için kullanılır. Örneğin, geleneksel iş uygulamaları genellikle konfigürasyon dosyaları veya log dosyaları gibi ortak dosya kaynaklarına ihtiyaç duyar.

  Yedekleme ve Kurtarma:
        Sistemlerin ve verilerin yedeklenmesi için kullanılır. Azure File Storage, dosyaları ve klasörleri düzenli olarak yedekleyerek, veri kaybına karşı koruma sağlar.

  Veri Paylaşımı:
        İşletmeler arasında veya işletme içinde veri paylaşımı sağlamak için kullanılır. Özellikle, farklı lokasyonlardaki kullanıcıların aynı verilere erişmesi gerektiğinde etkilidir.

  Karma Senaryolar:
        Yerel sunucularla ve bulut hizmetleriyle entegre çalışan sistemlerde dosya senkronizasyonu ve yönetimi için kullanılır. Örneğin, yerel ve bulut sistemler arasında dosya senkronizasyonu sağlayarak iş sürekliliği ve esneklik sunar.

  Modernize Edilmiş Dosya Sunucusu:
        Geleneksel dosya sunucularını modernize etmek veya yerel dosya sunucularını tamamen buluta taşımak için kullanılır. Bu, IT yönetimini basitleştirir ve altyapı maliyetlerini azaltır.

Kullanım Nedenleri

  Kolay Erişim ve Entegrasyon:
        Azure File Storage, standart SMB protokolünü destekler, bu da onu Windows, macOS ve Linux sistemler ile uyumlu hale getirir. Uygulamalar ve kullanıcılar için bulut tabanlı bir dosya sistemine geçişte bu, büyük bir avantaj sağlar.

  Ölçeklenebilirlik:
        İhtiyaçlar arttıkça depolama kapasitesini kolaylıkla ve hızla artırabilirsiniz. Bu, özellikle değişken iş yüklerine sahip organizasyonlar için idealdir.

  Dayanıklılık ve Yüksek Kullanılabilirlik:
        Azure, dosyalarınızı çeşitli hata senaryolarına karşı koruyacak şekilde tasarlanmıştır. Verileriniz, Azure'ın global veri merkezleri arasında otomatik olarak çoğaltılır, bu da yüksek kullanılabilirlik ve veri dayanıklılığı sağlar.

  Güvenlik:
        Azure, verilerinizi şifreleyerek ve erişim kontrolleri ile koruyarak güvenliği sağlar. Ayrıca, veri şifrelemesi ve ağ güvenliği gibi konularda kapsamlı çözümler sunar.

  Maliyet Etkinliği:
        Azure File Storage, özellikle geniş kapasiteli ve az kullanılan dosyalar için maliyet açısından etkili bir çözüm sunar. Pay-as-you-go modeli, yalnızca kullanılan kaynaklar için ödeme yapmanızı sağlar.

Azure File Storage, esnek, güvenli ve ölçeklenebilir bir dosya depolama çözümü olarak, birçok işletme ve uygulama için tercih edilen bir seçenektir. İş süreçlerini basitleştirirken, veri erişimini ve işbirliğini kolaylaştırır.

# Özet
İşte öğrendiklerimizin kısa bir özeti:

  Azure Blob Storage: Büyük miktarda yapılandırılmamış veriyi depolamak için kullanılır. Blob Storage, medya dosyaları, belgeler ve diğer büyük veri kümeleri için idealdir ve verileri bloblar olarak kapsayıcılarda saklar.

  Azure File Storage: Paylaşılan dosya depolama çözümüdür. SMB protokolü üzerinden erişilebilir ve geleneksel dosya sunucularının yerini alabilir veya onlarla entegre çalışabilir.

  Azure Queue Storage: Uygulamalar arası asenkron iletişim için mesaj kuyruklama servisidir. Bu, farklı uygulama bileşenleri arasında veri aktarımını düzenleyerek iş yüklerini yönetir.

  Azure Table Storage: Yapılandırılmamış ve yarı yapılandırılmış veriler için NoSQL tabanlı bir depolama çözümüdür. Ölçeklenebilir ve esnek şema sunarak geniş veri kümeleri için uygundur.

Azure Storage hizmetleri, veri depolama ve yönetimi ihtiyaçlarına geniş bir çözüm yelpazesi sunar. Maliyet etkinliği, ölçeklenebilirlik, güvenlik ve performans açısından esnek yapılandırmalar sunarak, uygulamalarınızın ve iş akışlarınızın verimli bir şekilde çalışmasını sağlar. Her bir hizmet, belirli ihtiyaçlara göre özelleştirilebilir ve Azure ekosistemi içinde kolayca entegre edilebilir. Bu da Azure'un, modern iş yüklerini destekleme ve dijital dönüşümünüzü hızlandırma konusunda güçlü bir ortak olmasını sağlar.



