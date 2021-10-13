# SentimentAnalysis
A aplicação permite a pesquisa de um usuário do Twitter pelo seu username, e caso seja encontrado, apresenta os primeiros tweets mais recentes desse usuário. E apresenta uma possível avaliação de sentimentos em relação a esse tweet, podendo estar sendo classificada em três possíveis sentimentos: triste, neutro e feliz, quando o mesmo for selecionado na lista, sendo mostrado três possíveis emojis para representar esses sentimentos.

# Arquitetura e estrutura
A aplicação foi desenvolvida utilizando uma arquitetura MVVM-C. As telas foram criadas com princípios de View Code. Foi utilizado alguns patterns para alcançar uma arquitetura mais modular, como UseCase e Repository.

# Bibliotecas utilizadas
- CocoaPods para gerenciamento de dependências;
- RXSwift para comunicação assíncrona e reativa;
- Swinject para a injeção de dependências;
- Moya para a comunicação com as APIs;
- ObjectMapper para o mapeamento da serialização das respostas das APIs;
- lottie para animações;
- SwiftSpinner para loading;
- BRYXBanner para apresentar alerta de mensagens temporárias;
- RxBlocking para auxílio na camada de testes.

# APIs utilizadas
- API REST do Twitter (https://developer.twitter.com)
- API REST do Google Natural Language (https://cloud.google.com/natural-language)

# Instalação
pod install

# Como rodar
As chaves tanto para a API do Twitter quanto da API do Google ainda se encontram funcionais para testes, portanto é só rodar a aplicação que tudo deverá funcionar.
Caso não mais funcione, será porque já foi intencionalmente desativado as chaves, sendo necessário atualizá-las dentro de Resources/Configuration.plist
