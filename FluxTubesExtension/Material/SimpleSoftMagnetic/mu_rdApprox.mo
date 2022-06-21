within FluxTubesExtension.Material.SimpleSoftMagnetic;
function mu_rdApprox
  "Approximation of mu_rd(H) for simple soft magnetic materials"
  extends Modelica.Icons.Function;

  input Integer N "Count of exponential summands";
  input SI.MagneticFieldStrength Hk[N] "Field strength coefficients";
  input SI.MagneticFluxDensity Bk[N] "Flux density coefficients";
  input SI.MagneticFieldStrength H
      "Field strength in ferromagnetic flux tube element";

  output SI.RelativePermeability mu_rd
      "Differential relative magnetic permeability of ferromagnetic flux tube element";

algorithm
  mu_rd := 1 + sum({Bk[k]/(mu_0*Hk[k])*exp(-abs(H)/Hk[k]) for k in 1:N});
end mu_rdApprox;
