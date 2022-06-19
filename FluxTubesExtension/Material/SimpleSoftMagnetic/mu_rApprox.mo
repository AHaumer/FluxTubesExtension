within FluxTubesExtension.Material.SimpleSoftMagnetic;
function mu_rApprox
  "Approximation of mu_r(H) for simple soft magnetic materials"
  extends Modelica.Icons.Function;

  input FluxTubesExtension.Material.SimpleSoftMagnetic.BaseData material
    "Material specific parameter set";
  input SI.MagneticFieldStrength H
      "Field strength in ferromagnetic flux tube element";

  output SI.RelativePermeability mu_r
      "Relative magnetic permeability of ferromagnetic flux tube element";

algorithm
  mu_r :=if abs(H) < Modelica.Constants.small then material.mu_i else
    1 + sum({material.Bk[k]/(mu_0*abs(H))*(1 - exp(-abs(H)/material.Hk[k])) for k in 1:material.N});
  annotation (Inline=true);
end mu_rApprox;
