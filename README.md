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

### Dependencies
- esy
- opam
- dune

### Compile and Execute

##### Build
```bash
# build the project with esy
$ esy
```

##### Exec:
```bash
$ esy dune exec imageproc.exe <ppm_file>
```

### Refs
* [Artigo no Wikipedia - Kernel](https://en.wikipedia.org/wiki/Kernel_(image_processing))
* [Artigo no Wikipedia - Operador de Sobel](https://en.wikipedia.org/wiki/Sobel_operator)
* [Computerphile - Filters](https://www.youtube.com/watch?v=C_zFhWdM4ic)
* [Computerphile - Edge detection](https://www.youtube.com/watch?v=uihBwtPIBxM)      
      
