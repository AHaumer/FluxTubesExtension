within FluxTubesExtension.Material.SimpleSoftMagnetic;
function mu_rApprox
  "Approximation of mu_r(H) for simple soft magnetic materials"
  extends Modelica.Icons.Function;

  input Integer N "Count of exponential summands";
  input SI.MagneticFieldStrength Hk[N] "Field strength coefficients";
  input SI.MagneticFluxDensity Bk[N] "Flux density coefficients";
  input SI.MagneticFieldStrength H
      "Field strength in ferromagnetic flux tube element";

  output SI.RelativePermeability mu_r
      "Relative magnetic permeability of ferromagnetic flux tube element";
protected
  SI.RelativePermeability mu_i=1 + sum({Bk[k]/(mu_0*Hk[k]) for k in 1:N});
algorithm
  if abs(H) < Modelica.Constants.small then
    mu_r :=mu_i;
  else
    mu_r :=1;
     for k in 1:N loop
       mu_r :=mu_r + Bk[k]/(mu_0*abs(H))*(1 - exp(-abs(H)/Hk[k]));
     end for;
  end if;
end mu_rApprox;
