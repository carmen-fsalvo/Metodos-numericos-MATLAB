# Cálculo Numérico, Análisis Estadístico y Física Experimental en MATLAB

Este repositorio reúne los scripts desarrollados en MATLAB para el tratamiento de datos experimentales, métodos numéricos de integración y modelado de sistemas físicos en la Universidad Autónoma de Madrid (UAM)[cite: 2, 7, 8].

## Contenido del Repositorio

* **Técnicas Experimentales y Laboratorio de Física:**
  * **Física Moderna y Cuántica:** Análisis de datos para la caracterización de las líneas de Balmer, difracción de electrones, efecto fotoeléctrico y óptica electrónica (`tec3_LineasdeBalmer.m`, `tec3_difraccionElectrones.m`, `tec3_efecto_fotoelectrico.m`)[cite: 2, 8].
  * **Electrónica y Óptica:** Experimentos con microondas y análisis de carga/descarga de circuitos (`tec3_microondas.m`, `cargaydescarga.m`)[cite: 2, 8].
  * **Mecánica y Constantes Físicas:** Determinación de la constante elástica de un muelle (`Tec.experimentales.CTE K.MUELLE.m`)[cite: 8].

* **Análisis de Datos, Estadística y Ajustes:**
  * Cálculo de estadísticas descriptivas, binning de datos y normalización gaussiana (`mean,median,stand.deviation.m`, `binning temperature.m`)[cite: 7].
  * Ajustes de datos no lineales, polinómicos y gaussianos (`Fitting a Gaussian.m`, `fitting temp. to 3rd polinomial.m`)[cite: 7].
  * Interpolación de datos (`linterpol.m`)[cite: 7].

* **Ecuaciones Diferenciales Ordinarias (EDO) y Modelos Físicos:**
  * Implementación de esquemas de integración: Euler, Euler Modificado y Runge-Kutta de 2º y 4º orden (`euler.m`, `meuler.m`, `rk2.m`, `rk4.m`)[cite: 7, 8].
  * Aplicaciones a sistemas físicos y biológicos: Presión barométrica, oscilador armónico y modelos depredador-presa de Lotka-Volterra (`barometric pressure.m`, `harmonic oscillator.m`, `proyectopredatorprey.m`)[cite: 7, 8].
  * Transformaciones geométricas y álgebra vectorial: Rotación de vectores en 2D y 3D (`rotar vector 3D.m`)[cite: 8].

## Tecnologías Utilizadas
* MATLAB
