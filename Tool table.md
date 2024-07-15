# Tool table


|          | Описание                                                                                                                                                                                                                              | Типы zkSNARK                              | Технологии               | Эллиптическая кривая                                                |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- | ------------------------ | ------------------------------------------------------------------- |
| gnark    | API высокого уровня с фронтендом и бэкендом для разработки схем                                                                                                                                                                       | Groth16, PlonK                            | Go                       | BN254, BLS12-381, BLS12-377, BW6-761, BLS24-315, BW6-633, BLS24-317 |
| SnarkJs  | Эта библиотека включает в себя все инструменты, необходимые для проведения многосторонних церемоний доверенной настройки: включая универсальные возможности церимонии первой фазы (Power of Tou) и специальные церемонии второй фазы. | PLONK, Groth16, FFLONK                    | Js, NodeJs               | BN128                                                               |
| ZoKrates | Большой нобор инструментов для zkSNARKs на Ethereum.                                                                                                                                                                                  | Groth16                                   | Etherium, Solidity, R1CS | BN254                                                               |
| LibSnark | Эта библиотека реализует схемы zkSNARK, которые являются криптографическим методом для доказательства/проверки целостности вычислений с нулевым разглашением.                                                                         | Groth16                                   | C++, R1CS, Cmake, GMP    | BN128, alt_bn128, Edwards25519                                      |
| arkworks | Библиотеки в экосистеме arkworks обеспечивают эффективные реализации всех компонентов, необходимых для реализации приложений zkSNARK, от общих конечных полей до ограничений R1CS для общих функций.                                  | groth16, marlin, r1cs, gm17, gemini, ripp | Rust, Python             | BN256, Edwards25519,  BLS12-381                                     |
| libiop   | Эта библиотека предоставляет конструкции zkSNARK, которые являются прозрачными и пост-квантовыми и, кроме того, полагаются только на облегченную симметричную криптографию.                                                           | Ligero, Aurora, Fractal                   | R1CS, С++, Cmake, Sage   | BLS12-381, BN256                                                    |
| plonk    | Чистая реализация системы PLONK ZKProof на Rust                                                                                                                                                                                       | PLONK                                     | Rust                     | BLS12-381                                                           |
