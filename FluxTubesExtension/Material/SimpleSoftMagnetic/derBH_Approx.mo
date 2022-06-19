within FluxTubesExtension.Material.SimpleSoftMagnetic;
function derBH_Approx
  "Approximation of der(B(H)) for simple soft magnetic materials"
  extends Modelica.Icons.Function;

  input FluxTubesExtension.Material.SimpleSoftMagnetic.BaseData material
    "Material specific parameter set";
  input SI.MagneticFieldStrength H
      "Field strength in ferromagnetic flux tube element";
  input Real der_H(unit="A/(m.s)")
      "Derivative of field strength in ferromagnetic flux tube element";

  output Real der_B(unit="T/s")
      "Derivative of flux density in ferromagnetic flux tube element";

algorithm
//der_B := mu_0*mu_rdApprox(material, H)*der_H;
  der_B := (mu_0 + sum({material.Bk[k]/material.Hk[k]*exp(-abs(H)/material.Hk[k]) for k in 1:material.N}))*der_H;
  annotation (Inline=true);
end derBH_Approx;
