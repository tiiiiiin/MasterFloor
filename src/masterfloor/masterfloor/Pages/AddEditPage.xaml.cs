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
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {
        public Data.partners_import _currentPartners = new Data.partners_import();
        public string FlagAddOrEdit = "default";

        public ViewPage ViewPage { get; set; }
        public AddEditPage(Data.partners_import partners_import)
        {
            InitializeComponent();
            if (partners_import == null)
            {
                FlagAddOrEdit = "add";
                _currentPartners = new Data.partners_import//нужно инициализировать директора для работы с таблицей
                {
                    Director = new Data.Director()
                };
            }
            else
            {
                _currentPartners = partners_import;
                FlagAddOrEdit = "edit";
            }
            DataContext = _currentPartners;

            Init();
        }
        public void Init()
        {
            try
            {
                TypePartnerComboBox.ItemsSource = Data.masterFloorEntities.GetContext().TypePartner.ToList();

                if (FlagAddOrEdit == "add")
                {
                    NamePartnerTextBox.Text = string.Empty;
                    TypePartnerComboBox.SelectedItem = null;
                    LastNameTextBox.Text = string.Empty;
                    FirstNameTextBox.Text = string.Empty;
                    PatronymicNaneTextBox.Text = string.Empty;
                    EmailTextBox.Text = string.Empty;
                    PhoneNumTextBox.Text = string.Empty;
                    RatingTextBox.Text = string.Empty;
                    InnTextBox.Text = string.Empty;
                    IndexTextBox.Text = string.Empty;
                    AreaTextBox.Text = string.Empty;
                    CityTextBox.Text = string.Empty;
                    StreetTextBox.Text = string.Empty;
                    NumHouseTextBox.Text = string.Empty;
                }
                else if (FlagAddOrEdit == "edit")
                {
                    NamePartnerTextBox.Text = _currentPartners.NamePartner.Name;
                    TypePartnerComboBox.SelectedItem = Data.masterFloorEntities.GetContext().TypePartner.Where(d => d.Id == _currentPartners.IdTypePartner).FirstOrDefault();
                    LastNameTextBox.Text = _currentPartners.Director.LastName;
                    FirstNameTextBox.Text = _currentPartners.Director.FirstName;
                    PatronymicNaneTextBox.Text = _currentPartners.Director.PatronymicName;
                    EmailTextBox.Text = _currentPartners.Email;
                    PhoneNumTextBox.Text = _currentPartners.PhoneNum;
                    RatingTextBox.Text = _currentPartners.Rating.ToString();
                    InnTextBox.Text = _currentPartners.INN;
                    IndexTextBox.Text = _currentPartners.LegalAdress.Indexes.Name;
                    AreaTextBox.Text = _currentPartners.LegalAdress.Area.Name;
                    CityTextBox.Text = _currentPartners.LegalAdress.City.Name;
                    StreetTextBox.Text = _currentPartners.LegalAdress.Street.Name;
                    NumHouseTextBox.Text = _currentPartners.LegalAdress.NumHouse.ToString();

                }
            }
            catch (Exception ex)
            {

            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }
        }

        private void SaveButtin_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(NamePartnerTextBox.Text))
                {
                    errors.AppendLine("введите наименование партнера");
                }
                if (TypePartnerComboBox.SelectedItem == null)
                {
                    errors.AppendLine("выберите тип партнера");
                }
                if (string.IsNullOrEmpty(LastNameTextBox.Text))
                {
                    errors.AppendLine("введите фамилию партнера");
                }
                if (string.IsNullOrEmpty(FirstNameTextBox.Text))
                {
                    errors.AppendLine("введите имя партнера");
                }
                if (string.IsNullOrEmpty(PatronymicNaneTextBox.Text))
                {
                    errors.AppendLine("введите отчество партнера");
                }
                if (string.IsNullOrEmpty(EmailTextBox.Text))
                {
                    errors.AppendLine("введите почту партнера");
                }

                if (FlagAddOrEdit == "add") // Проверка уникальности почты только при добавлении
                {
                    // Проверка, существует ли уже партнер с таким email
                    if (Data.masterFloorEntities.GetContext().partners_import.Any(d => d.Email == EmailTextBox.Text))
                    {
                        MessageBox.Show("Такая учетная запись уже существует, создайте новую или заходите под старой!", "Предупреждение!", MessageBoxButton.OK, MessageBoxImage.Information);
                        return;
                    }
                }
                if (string.IsNullOrEmpty(PhoneNumTextBox.Text))
                {
                    errors.AppendLine("введите телефон партнера");
                }

                string phoneNumberPattern = @"^\+\d{1}\(\d{3}\)-\d{3}-\d{2}-\d{2}$";
                if (!System.Text.RegularExpressions.Regex.IsMatch(PhoneNumTextBox.Text, phoneNumberPattern))
                {
                    errors.AppendLine("некорректный формат телефона! формат должен быть: +#(###)-###-##-##");
                }

                

                if (!string.IsNullOrEmpty(RatingTextBox.Text))
                {
                    if (Int32.TryParse(RatingTextBox.Text, out var resultRating))
                    {
                        if (resultRating < 0)
                        {
                            errors.AppendLine("рейтинг партнера должен быть неотрицательным числом");
                        }
                    }
                    else
                    {
                        errors.AppendLine("рейтинг партнера должен быть целым числом");
                    }
                }
                else
                {
                    errors.AppendLine("введите рейтинг партнера");
                }

                if (string.IsNullOrEmpty(InnTextBox.Text))
                {
                    errors.AppendLine("введите инн");
                }
                string inn = @"^\d{10}$";
                if (!System.Text.RegularExpressions.Regex.IsMatch(InnTextBox.Text, inn))
                {
                    errors.AppendLine("некорректный формат инн! формат должен быть: ########## (10)");
                }

                if (string.IsNullOrEmpty(IndexTextBox.Text))
                {
                    errors.AppendLine("введите индекс");

                }
                string index = @"^\d{6}$";
                if (!System.Text.RegularExpressions.Regex.IsMatch(IndexTextBox.Text, index))
                {
                    errors.AppendLine("некорректный формат инн! формат должен быть: ###### (6)");
                }

                if (string.IsNullOrEmpty(AreaTextBox.Text))
                {
                    errors.AppendLine("введите облать партнера");
                }
                if (string.IsNullOrEmpty(CityTextBox.Text))
                {
                    errors.AppendLine("введите город партнера");
                }
                if (string.IsNullOrEmpty(StreetTextBox.Text))
                {
                    errors.AppendLine("введите улицу партнера");
                }
                if (string.IsNullOrEmpty(NumHouseTextBox.Text))
                {
                    errors.AppendLine("введите номер дома партнера");
                }

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }


                var typePartnerComboBox = TypePartnerComboBox.SelectedItem as Data.TypePartner;
                _currentPartners.IdTypePartner = typePartnerComboBox.Id;


                _currentPartners.Director.LastName = LastNameTextBox.Text;
                _currentPartners.Director.FirstName = FirstNameTextBox.Text;
                _currentPartners.Director.PatronymicName = PatronymicNaneTextBox.Text;
                _currentPartners.Email = EmailTextBox.Text;
                _currentPartners.PhoneNum = PhoneNumTextBox.Text;
              
                _currentPartners.Rating = Convert.ToInt32(RatingTextBox.Text);
                _currentPartners.INN = InnTextBox.Text;

                var namepartner = (from obj in Data.masterFloorEntities.GetContext().NamePartner
                                   where obj.Name == NamePartnerTextBox.Text
                                   select obj).FirstOrDefault();
                if (namepartner != null)
                {
                    _currentPartners.IdNamePartner = namepartner.Id;
                }
                else
                {
                    Data.NamePartner namePartner = new Data.NamePartner()
                    {
                        Name = NamePartnerTextBox.Text,
                    };
                    Data.masterFloorEntities.GetContext().NamePartner.Add(namePartner);
                    Data.masterFloorEntities.GetContext().SaveChanges();

                    _currentPartners.IdNamePartner = namePartner.Id;
                }



                var areaText = (from obj in Data.masterFloorEntities.GetContext().Area// Проверка или добавление записи в таблице Area
                                where obj.Name == AreaTextBox.Text
                                select obj).FirstOrDefault();
                if (areaText == null)
                {
                    areaText = new Data.Area { Name = AreaTextBox.Text };
                    Data.masterFloorEntities.GetContext().Area.Add(areaText);
                    Data.masterFloorEntities.GetContext().SaveChanges();
                }


                var cityText = (from obj in Data.masterFloorEntities.GetContext().City //Проверка или добавление записи в таблице City
                                where obj.Name == CityTextBox.Text
                                select obj).FirstOrDefault();
                if (cityText == null)
                {
                    cityText = new Data.City { Name = CityTextBox.Text };
                    Data.masterFloorEntities.GetContext().City.Add(cityText);
                    Data.masterFloorEntities.GetContext().SaveChanges();
                }

                    
                var streetText = (from obj in Data.masterFloorEntities.GetContext().Street  // Проверка или добавление записи в таблице Street
                                  where obj.Name == StreetTextBox.Text
                                  select obj).FirstOrDefault();
                if (streetText == null)
                {
                    streetText = new Data.Street { Name = StreetTextBox.Text };
                    Data.masterFloorEntities.GetContext().Street.Add(streetText);
                    Data.masterFloorEntities.GetContext().SaveChanges();
                }

                var indexText = (from obj in Data.masterFloorEntities.GetContext().Indexes
                                 where obj.Name == IndexTextBox.Text
                                 select obj).FirstOrDefault();
                if (indexText == null)
                {
                    indexText = new Data.Indexes { Name = IndexTextBox.Text };
                    Data.masterFloorEntities.GetContext().Indexes.Add(indexText);
                    Data.masterFloorEntities.GetContext().SaveChanges();
                }


                var legalAddress = (from obj in Data.masterFloorEntities.GetContext().LegalAdress//создание или нахождение записи в таблице LegalAdress
                                    where obj.IdArea == areaText.Id
                                          && obj.IdCity == cityText.Id
                                          && obj.IdStreet == streetText.Id
                                          && obj.NumHouse == NumHouseTextBox.Text
                                          && obj.IdIndexes == indexText.Id
                                    select obj).FirstOrDefault();

                if (legalAddress == null)
                {

                    legalAddress = new Data.LegalAdress// Создание новой записи в LegalAdress, если подходящей нет
                    {
                        IdArea = areaText.Id,
                        IdCity = cityText.Id,
                        IdStreet = streetText.Id,
                        NumHouse = NumHouseTextBox.Text,
                        IdIndexes = indexText.Id
                    };
                    Data.masterFloorEntities.GetContext().LegalAdress.Add(legalAddress);
                    Data.masterFloorEntities.GetContext().SaveChanges();
                }


                _currentPartners.IdLegalAdress = legalAddress.Id;//Устанавливается ссылка на LegalAdress в партнёре

                if (FlagAddOrEdit == "edit")
                {
                    Data.masterFloorEntities.GetContext().SaveChanges();
                    MessageBox.Show("Успешно сохранено!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else if (FlagAddOrEdit == "add")
                {
                    Data.masterFloorEntities.GetContext().partners_import.Add(_currentPartners);
                    Data.masterFloorEntities.GetContext().SaveChanges();

                    MessageBox.Show("Успешно добавлено!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                if (ViewPage != null)
                {
                    ViewPage.Init();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
