using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace masterfloorAccountMaterial.Classes
{
    public class CalculateMaterial
    {
        public int Calculate(int IdTypeProduct, int IdTypeOfMaterial, int CountOFProducts,
            double param1, double param2)
        {
            try
            {
                double counOn1 = param1 * param2 * Convert.ToDouble(Data.masterFloorEntities.GetContext().product_type_import.Where(d => d.Id == IdTypeProduct).FirstOrDefault().CoefProduct);
                counOn1 += (param1 * param2 * Convert.ToDouble(Data.masterFloorEntities.GetContext().product_type_import.Where(d => d.Id == IdTypeProduct).FirstOrDefault().CoefProduct))
                    * Convert.ToDouble(Data.masterFloorEntities.GetContext().Material_type_import.Where(d => d.Id == IdTypeOfMaterial).FirstOrDefault().PercenMarriag);

                return Convert.ToInt32(Math.Round(counOn1 * CountOFProducts));
            }
            catch (Exception ex)
            {
                return -1;
            }
        }
    }
}
