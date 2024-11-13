using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace masterfloor.Pages
{
    /// <summary>
    /// Логика взаимодействия для HistoryPage.xaml
    /// </summary>
    public partial class HistoryPage : Page
    {
        public HistoryPage(int partnerId)
        {
            InitializeComponent(); LoadHistoryData(partnerId);
        }
        private void LoadHistoryData(int partnerId)
        {

            var historyData = Data.masterFloorEntities.GetContext().partner_products_import
                .Where(p => p.IdNamePartner == partnerId)
                .Select(p => new
                {
                    p.Id,
                    p.IdNameProduct,
                  
                    p.CountOfProduct,
                    p.DataOfSale
                })
                .ToList();

            HistoryDataGrid.ItemsSource = historyData;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }
        }
    }
}
