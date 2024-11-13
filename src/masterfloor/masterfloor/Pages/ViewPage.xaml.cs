using masterfloor.Data;
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
    /// Логика взаимодействия для ViewPage.xaml
    /// </summary>
    public partial class ViewPage : Page
    {
        public ViewPage()
        {
            InitializeComponent();
            Init();
        }
        public void Init()
        {
            PartnersListView.ItemsSource = Data.masterFloorEntities.GetContext().partners_import.ToList();
        }
        public List<Data.partners_import> __currentPartners = Data.masterFloorEntities.GetContext().partners_import.ToList();


        private void DiscountTextBlock_Loaded(object sender, RoutedEventArgs e)
        {
            var discountTextBlock = sender as TextBlock;

            var discountpartner = discountTextBlock.DataContext as partners_import;
            if (discountpartner == null)
            {
                discountTextBlock.Text = "Нет данных";
                return;
            }

            try
            {
                if (discountpartner != null)
                {
                    var PriceTotal = Data.masterFloorEntities.GetContext()
                    .partner_products_import
                    .Where(d => d.IdNamePartner == discountpartner.IdNamePartner)
                    .Sum(d => d.CountOfProduct);

                    string Percent = "";
                    if (PriceTotal >= 300000)
                    {
                        Percent = "15%";
                    }
                    else if (PriceTotal >= 50000)
                    {
                        Percent = "10%";
                    }
                    else if (PriceTotal >= 10000)
                    {
                        Percent = "5%";
                    }
                    else
                    {
                        Percent = "0%";
                    }

                    discountTextBlock.Text = Percent;
                }


            }
            catch (Exception ex)
            {
                discountTextBlock.Text = "Недостаточно данных";
            }
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddEditPage((sender as Button).DataContext as Data.partners_import));
        }

        private void HistoryButton_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            var partner = button.DataContext as partners_import;

            if (partner != null)
            {
                Classes.Manager.MainFrame.Navigate(new HistoryPage(partner.Id));
            }
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddEditPage(null));
        }
    }
}
