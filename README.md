# SentimentAnalysis

A aplicação foi desenvolvida utilizando uma arquitetura MVVM-C. As telas foram criadas com princípios de View Code. Foi utilizado alguns patterns para alcançar uma arquitetura mais modular, como UseCase e Repository.

# Bibliotecas utilizadas
- CocoaPods para gerenciamento de dependências;
- RXSwift para comunicação assíncrona e reativa;
- Swinject para a injeção de dependências;
- Moya para a comunicação com as APIs;
- ObjectMapper para o mapeamento da serialização das respotas das APIs;
- lottie para animações;
- SwiftSpinner para loading;
- BRYXBanner para apresentar alerta de mensagens temporárias;
- RxBlocking para auxílio na camada de testes.

# Instalação
pod install

# Como rodar
As chaves tanto para a API do Twitter quanto da API do Google ainda se encontram funcionais para testes, portanto é só rodar a aplicação que tudo deverá funcionar.
Caso não mais funcione, será porque já foi intencionalmente desativado as chaves, sendo necessário atualizá-las dentro de Resources/Configuration.plist
