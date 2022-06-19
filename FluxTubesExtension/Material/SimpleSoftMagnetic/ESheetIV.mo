within FluxTubesExtension.Material.SimpleSoftMagnetic;
record ESheetIV "E-Sheet IV"
  extends BaseData(
    label="E-Sheet IV",
    N=4,
    Hk={222.3984153, 266.0916055, 409.5538415, 8340.296158},
    Bk={9.091490607, -9.798850574, 2.06558544, 0.401580562});
  annotation (defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://FluxTubesExtension.Material.SimpleSoftMagnetic\">SimpleSoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
end ESheetIV;
