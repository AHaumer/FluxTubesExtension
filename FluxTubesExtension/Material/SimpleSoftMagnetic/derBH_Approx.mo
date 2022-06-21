within FluxTubesExtension.Material.SimpleSoftMagnetic;
function derBH_Approx
  "Approximation of der(B(H)) for simple soft magnetic materials"
  extends Modelica.Icons.Function;

  input Integer N "Count of exponential summands";
  input SI.MagneticFieldStrength Hk[N] "Field strength coefficients";
  input SI.MagneticFluxDensity Bk[N] "Flux density coefficients";
  input SI.MagneticFieldStrength H
      "Field strength in ferromagnetic flux tube element";
  input Real der_H(unit="A/(m.s)")
      "Derivative of field strength in ferromagnetic flux tube element";

  output Real der_B(unit="T/s")
      "Derivative of flux density in ferromagnetic flux tube element";

algorithm
  der_B := (mu_0 + sum({Bk[k]/Hk[k]*exp(-abs(H)/Hk[k]) for k in 1:N}))*der_H;
end derBH_Approx;
