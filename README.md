# Image processing program for training OCaml

## Developed by:

* [Tiago Onofre Araujo](https://github.com/OnofreTZK)

### Functional Requirements
   Function | Status
   ------------ | -------------
   Read Image | Complete
   Write Image | Complete
   Menu | Complete
   Gray Scale | Complete
   Binarization | Complete
   Rotation  | TODO 
   Enlarge| TODO
   Reduce | TODO
   Filters | Complete
   Border Detection | Incomplete

### O que poderia ter sido feito diferente

    * A execução do programa com mais de uma imagem passada como parâmetro
    * Permitir o usuário escolher qual das imagens quer processar
    * Utilizar uma imagem transformada em outro processo sem a necessidade de executar o programa novamente
    * Permitir o usuário escolher o zoom nas funções de reduzir e ampliar
    * Permitir o usuário escolher quantas vezes aplicar cada filtro
    * Implementação de compressão de imagem, transformada de Hough e detecção de objetos
    * Recursividades mais complexas
    * Interface gráfica
    * Verificar se a imagem gerada foi nula

### Compilação e execução
##### Para baixar o código na sua maquina:
```bash
$ git clone https://github.com/OnofreTZK/ITP_photoshop.git
```   
##### Após baixar o repositório, vá até a pasta raiz e:
```bash
# Digite 'make all' para compilar
$ make all

# As seguintes mensagens devem aparecer:

gcc ./src/*.c -Wall -lm -I ./include -o ./bin/proj
proj -> ./bin/proj
Compilado com sucesso! Para executar digite ./proj imagem.ppm
      
# Quando finalizar a execução digite 'make clean' para limpar os arquivo binários
$ make clean

# A seguinte mensagem deve aparecer:

Binários excluidos com sucesso!
```
##### Para executar:
```bash
$ ./proj imagem.ppm
```
sendo `./proj` o nome do executável e `imagem.ppm` obrigatoriamente uma imagem do tipo `.ppm`, caso não tenha, esse repositório conta com duas: `got.ppm` e `ts.ppm`

### Referências que auxiliaram no desenvolvimento
* [Artigo no Wikipedia - Kernel](https://en.wikipedia.org/wiki/Kernel_(image_processing))
* [Artigo no Wikipedia - Operador de Sobel](https://en.wikipedia.org/wiki/Sobel_operator)
* [Computerphile - Filters](https://www.youtube.com/watch?v=C_zFhWdM4ic)
* [Computerphile - Edge detection](https://www.youtube.com/watch?v=uihBwtPIBxM)      
      
