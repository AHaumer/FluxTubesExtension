within FluxTubesExtension.Material.SimpleSoftMagnetic;
function mu_rdApprox
  "Approximation of mu_rd(H) for simple soft magnetic materials"
  extends Modelica.Icons.Function;

  input FluxTubesExtension.Material.SimpleSoftMagnetic.BaseData material
    "Material specific parameter set";
  input SI.MagneticFieldStrength H
      "Field strength in ferromagnetic flux tube element";

  output SI.RelativePermeability mu_rd
      "Differential relative magnetic permeability of ferromagnetic flux tube element";

algorithm
  mu_rd := 1 +
    sum({material.Bk[k]/(mu_0*material.Hk[k])*exp(-abs(H)/material.Hk[k]) for k in 1:material.N});
  annotation (Inline=true);
end mu_rdApprox;
