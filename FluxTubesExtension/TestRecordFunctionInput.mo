within FluxTubesExtension;
package TestRecordFunctionInput "Test records as inputs of functions"
  extends Modelica.Icons.InternalPackage;

  package Examples
  extends Modelica.Icons.ExamplesPackage;
    model ShowSoftMagneticCharacteristic
      "Show characteristic of SoftMagnetic material"
      extends Modelica.Icons.Example;
      SI.MagneticFieldStrength H=-25E3 + 50E3*time
        "Magnetic field strength";
      parameter Material.BaseData material(
        N=4,
        Hk={250, 700, 3500, 16000},
        Bk={1.0, 1.4, 1.59, 1.8});
      SI.MagneticFluxDensity B=Material.BH_Approx(material, H)
        "Magnetic flux density";
      Real der_B(unit="T/s")=der(B)
        "Derivative of magnetic flux density";
        annotation (experiment(StopTime=1.0, Interval=0.0001, Tolerance=1e-06));
    end ShowSoftMagneticCharacteristic;
  end Examples;

  package Material
    extends Modelica.Icons.MaterialPropertiesPackage;


    record BaseData "Coefficients for approximation of soft magnetic materials with piecewise linear interpolation"
      extends Modelica.Icons.Record;
      parameter String label="SoftMagnetic" "Name of material";
      parameter SI.RelativePermeability mu_i=Bk[1]/(mu_0*Hk[1])
        "Initial relative permeability at B=0";
      parameter Integer N=1 "Count of nodes";
      parameter SI.MagneticFieldStrength Hk[N]={0} "Field strength coefficients";
      parameter SI.MagneticFluxDensity Bk[N]={0} "Flux density coefficients";
      annotation (defaultComponentPrefixes="parameter",
        Documentation(info="<html>
</html>"),     Icon(graphics={Text(
              extent={{-100,-10},{100,-40}},
              textColor={0,0,255},
              textString="%label")}));
    end BaseData;

    function BH_Approx "Piecewise linear B(H) interpolation"
      extends Modelica.Icons.Function;

      input BaseData material "Material specific parameters";
      input SI.MagneticFieldStrength H "Field strength in ferromagnetic flux tube element";

      output SI.MagneticFluxDensity B "Flux density in ferromagnetic flux tube element";

    protected
      Integer k=findInterval(material.Hk, H);
    algorithm
      B := if k<=1 then material.Bk[1]/material.Hk[1]*H else
           sign(H)*(material.Bk[k-1] + (material.Bk[k] - material.Bk[k-1])/(material.Hk[k] - material.Hk[k-1])*(abs(H) - material.Hk[k-1]));
      annotation(derivative(zeroDerivative=material)=derBH_Approx);
    end BH_Approx;

    function derBH_Approx "Piecewise linear der_B(H) interpolation"
      extends Modelica.Icons.Function;

      input BaseData material "Material specific parameters";
      input SI.MagneticFieldStrength H "Field strength in ferromagnetic flux tube element";
      input Real der_H(unit="A/(m.s)") "Derivative of field strength in ferromagnetic flux tube element";

      output Real der_B(unit="T/s") "Derivative of flux density in ferromagnetic flux tube element";

    protected
      Integer k=findInterval(material.Hk, H);
    algorithm
      der_B := if k<=1 then material.Bk[1]/material.Hk[1]*der_H else
               (material.Bk[k] - material.Bk[k-1])/(material.Hk[k] - material.Hk[k-1])*der_H;
    end derBH_Approx;

    function findInterval "Find interval for piecewise linear interpolation"
      extends Modelica.Icons.Function;
      input SI.MagneticFieldStrength Xk[:] "Nodes";
      input SI.MagneticFieldStrength x "Value to find interval";
      output Integer k "Interval Xk[k-1]..Xk[k]";
    protected
      Integer n=size(Xk, 1);
    algorithm
      k:=1;
      while abs(x)>=Xk[k] loop
        k:=k+1;
        if k>n then
          k:=n;
          break;
        end if;
      end while;
    end findInterval;

  annotation (Documentation(info="<html>
</html>"));


  end Material;
  annotation (preferredView="info",
                     versionDate="2022-06-21",
  Documentation(info="<html>
<p>
The only purpose is to test usage of records as input for functions.
</p>
</html>"));
end TestRecordFunctionInput;
