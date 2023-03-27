# Sow Good Frontend

## Instalando Flutter e Dart

Nosso projeto frontend será feito com [Flutter](https://docs.flutter.dev/get-started/install). Após realizado o download do .zip, deve extraí-lo e também, é necessário adicionar o caminho do bin dentro das variáveis de ambiente.

- Windows:

Sugestão de caminho onde extrair: `C:\src\` com o nome "flutter`. 

Sugestão de caminho das variáveis de ambiente: `C:\src\flutter\bin`.

- MacOS ou Linux:

Sugestão de caminho onde extrair: `~/development`. 

Rodar o comando para ajusta as variáveis de ambiente: `export PATH="$PATH:<caminho>/flutter/bin"`.

Após a configuração das variáveis será possível utilizar o `flutter doctor`, nele conseguimos ver se há alguma dependencia das plataformas faltando. 

## Utilizar Emulador

- Android:

Caso necessite utilizar um emulador ou rodar em um dispositivo físico será necessário baixar o [Android Studio](https://developer.android.com/studio). Para aceitar as licenças do Android SDK, você deve rodar o comando `flutter doctor --android-licenses`.
OBS: Não é possível rodar o emulador se a sua máquina tiver um processador AMD Ryzen

- iOS:

Caso necessite utilizar um emulador ou rodar em um dispositivo físico será necessário baixar o [Xcode](https://developer.apple.com/xcode/). Certifique-se de aceitar as licenças com o comando `sudo xcodebuild -license`.

## Clonando o projeto

Tendo o flutter instalado, clone o projeto em uma pasta local de sua preferência através do comando `git clone https://tools.ages.pucrs.br/sow-good/sow-good-frontend.git` (para isso você precisa do [git](https://git-scm.com/) instalado também).

## Extensões do VSCode

Aqui vai uma lista de extensões para se ter no VSCode e melhorar a experiência no desenvolvimento do projeto. A lista está separada por extensões obrigatórias (não ter essa extensão vai dificultar sua contribuição no projeto) e opcionais (não precisa ter, mas facilita um pouquinho a vida).

- Obrigatórias:
    - Flutter
    - Dart
    - GitLens
- Opcional:
    - Better Comments
    - IntelliCode
    - Live Share
    - Prettier - Code formatter
    - Rainbow Brackets

## Configuração do VSCode

Aqui vai uma sugestão de configuração do seu vscode, acesse o "help > show all comands" e selecione o "Preferences: Open User settings" `settings.json` e adicione:

    "[dart]": {
        "editor.codeActionsOnSave": {
            "source.fixAll": true
        },
        "editor.defaultFormatter": "Dart-Code.dart-code",
        "editor.formatOnSave": true,
    },
    
## Rodando o ambiente de desenvolvimento

Para rodar o projeto, primeiro é necessário rodar o comando `flutter pub get` ele serve para poder baixar todas as dependências do projeto, após finalizar rode o `flutter run` e escolha o dispositivo aonde deseja rodar, outra opção, é utilizar o botão `run` acima do método "main".

## Rodando o lint

O lint é uma ferramenta que checa algumas regras de convenção de código assim como formatação, para manter o padrão entre os desenvolvedores do time e manter um código consistente nesses padrões. O comando para rodar o lint é `flutter analyze`