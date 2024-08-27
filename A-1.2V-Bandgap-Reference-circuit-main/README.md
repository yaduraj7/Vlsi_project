# A-1.2V-Bandgap-Reference-circuit# 1.2V Band Gap Reference using Current Mirror

## Introduction

The 1.2V Band Gap Reference (BGR) circuit using a Current Mirror is a fundamental building block in analog and mixed-signal integrated circuits. It is designed to provide a stable voltage reference of 1.2V, independent of temperature variations. This README file aims to explain the key concepts of Band Gap Reference, CTAT (Complementary to Absolute Temperature), and PTAT (Proportional to Absolute Temperature) circuits, their slopes, and how they are combined to achieve a precise BGR.

## Band Gap Reference (BGR)

The Band Gap Reference is a voltage reference circuit that provides a constant voltage output, even when the temperature changes. It relies on the temperature-dependent characteristics of semiconductor materials to create a stable reference voltage. The BGR consists of two main components: the CTAT and PTAT circuits.

## CTAT (Complementary to Absolute Temperature) Circuit

The CTAT circuit generates a voltage that is complementary to absolute temperature changes. As the temperature increases, the voltage decreases, and vice versa. The temperature coefficient (TC_CTAT) of the CTAT circuit is typically negative, and it is given by the following equation:

TC_CTAT = - ∆V_CTAT / ∆T

where ∆V_CTAT is the change in voltage and ∆T is the change in temperature.

## PTAT (Proportional to Absolute Temperature) Circuit

The PTAT circuit generates a voltage that is directly proportional to absolute temperature changes. As the temperature increases, the voltage also increases linearly. The temperature coefficient (TC_PTAT) of the PTAT circuit is typically positive, and it is given by the following equation:

TC_PTAT = ∆V_PTAT / ∆T

where ∆V_PTAT is the change in voltage and ∆T is the change in temperature.

## Combining CTAT and PTAT for BGR

To achieve a precise Band Gap Reference, the CTAT and PTAT voltages are combined in a specific way. The BGR circuit includes a current mirror that scales the CTAT voltage and adds it to a fraction of the PTAT voltage. By appropriately adjusting the gain of the CTAT voltage, the BGR can generate a stable 1.2V output, independent of temperature changes.


## Conclusion

The 1.2V Band Gap Reference using Current Mirror is an essential circuit for providing a stable voltage reference in various analog and digital applications. By combining the temperature-dependent characteristics of CTAT and PTAT circuits, the BGR circuit can generate a precise 1.2V reference voltage, making it ideal for use in low-power and high-performance integrated circuits.

This README serves as a quick guide to understanding the Band Gap Reference concept, CTAT, PTAT, and their combination in a BGR circuit. For more detailed circuit analysis, simulations, and implementation, please refer to the project files and documentation in the repository.
