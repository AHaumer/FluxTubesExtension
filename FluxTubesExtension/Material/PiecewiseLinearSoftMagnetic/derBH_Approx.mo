within FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic;
function derBH_Approx "Piecewise linear der_B(H) interpolation"
  extends Modelica.Icons.Function;
  input FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic.BaseData material
    "Material specific parameter set";
  input SI.MagneticFieldStrength H "Field strength in ferromagnetic flux tube element";
  input Real der_H(unit="A/(m.s)") "Derivative of field strength in ferromagnetic flux tube element";
  output Real der_B(unit="T/s") "Derivative of flux density in ferromagnetic flux tube element";
protected
  Integer k=findInterval(material.Hk, H);
algorithm
  der_B := if k<=1 then material.Bk[1]/material.Hk[1]*der_H else
           (material.Bk[k] - material.Bk[k-1])/(material.Hk[k] - material.Hk[k-1])*der_H;
end derBH_Approx;
