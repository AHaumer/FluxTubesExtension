within FluxTubesExtension.Material.SimpleSoftMagnetic;
record ESheetI "E-Sheet I"
  extends BaseData(
    label="E-Sheet I",
    N=4,
    Hk={199.8108619, 494.0479218, 496.3476047, 11401.26261},
    Bk={1.219646142, 0.159207993, 0.109194471, 0.387439438});
  annotation (defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://FluxTubesExtension.Material.SimpleSoftMagnetic\">SimpleSoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
end ESheetI;
