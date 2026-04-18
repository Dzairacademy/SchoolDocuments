DROP TABLE IF EXISTS "ref"."Regions";
CREATE TABLE "ref"."Regions" (
	"Id" BIGSERIAL PRIMARY KEY,
    "RegionCode" VARCHAR(7)NOT NULL UNIQUE,
    "RegionNameAr" VARCHAR(100) NOT NULL UNIQUE,
    "RegionNameFr" VARCHAR(100)NOT NULL UNIQUE,
    "RegionPostalCode" VARCHAR(7),
   	"CreatedBy" INT8,
	"CreatedOn" TIMESTAMPTZ NOT NULL DEFAULT(NOW() at time zone 'utc'),
	"UpdatedBy" INT8,
	"UpdatedOn" TIMESTAMPTZ,
	"DeletedOn" TIMESTAMPTZ

);
/*
COPY ref.Regions("RegionCode", "RegionNameAr", "RegionNameFr","RegionPostalCode")
FROM 'F:/plateFormeScolarity2026/donnees/Regionclean.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8';
*/

INSERT INTO "ref"."Regions"("RegionCode", "RegionNameAr", "RegionNameFr", "RegionPostalCode") VALUES
('01', ' أدرار', ' Adrar', '01000'),
('02', '  الشلف', ' Chlef', '02000'),
('03', ' الأغواط', ' Laghouat', '03000'),
('04', ' أم البواقي', ' Oum El Bouaghi', '04000'),
('05', ' باتنة', ' Batna', '05000'),
('06', '  بجاية', ' Béjaïa', '06000'),
('07', ' بسكرة', ' Biskra', '07000'),
('08', ' بشار', ' Béchar', '08000'),
('09', ' البليدة', ' Blida', '09000'),
('10', ' البويرة', ' Bouira', '010000'),
('11', ' تمنراست', ' Tamanrasset', '11000'),
('12', ' تبسة', ' Tébessa', '12000'),
('13', ' تلمسان', ' Tlemcen', '13000'),
('14', ' تيارت', ' Tiaret', '14000'),
('15', ' تيزي وزو', ' Tizi Ouzou', '15000'),
('16', ' الجزائر', ' Alger', '16000'),
('17', ' الجلفة', ' Djelfa', '17000'),
('18', ' جيجل', ' Jijel', '18000'),
('19', ' سطيف', ' Sétif', '19000'),
('20', ' سعيدة', ' Saïda', '20000'),
('21', ' سكيكدة', ' Skikda', '21000'),
('22', ' سيدي بلعباس', ' Sidi Bel Abbès', '22000'),
('23', ' عنابة', ' Annaba', '23000'),
('24', ' قالمة', ' Guelma', '24000'),
('25', ' قسنطينة', ' Constantine', '25000'),
('26', ' المدية', ' Médéa', '26000'),
('27', ' مستغانم', ' Mostaganem', '27000'),
('28', ' المسيلة', ' MSila', '28000'),
('29', ' معسكر', ' Mascara', '29000'),
('30', ' ورقلة', ' Ouargla', '30000'),
('31', ' وهران', ' Oran', '31000'),
('32', ' البيض', ' El Bayadh', '32000'),
('33', ' إليزي', ' Illizi', '33000'),
('34', ' برج بوعريريج', ' Bordj Bou Arreridj', '34000'),
('35', ' بومرداس', ' Boumerdès', '35000'),
('36', ' الطارف', ' El Taref', '36000'),
('37', ' تندوف', ' Tindouf', '37000'),
('38', ' تيسمسيلت', ' Tissemsilt', '38000'),
('39', ' الوادي', ' El Oued', '39000'),
('40', ' خنشلة', ' Khenchela', '40000'),
('41', ' سوق أهراس', ' Souk Ahras', '41000'),
('42', ' تيبازة', ' Tipaza', '42000'),
('43', ' ميلة', ' Mila', '43000'),
('44', ' عين الدفلة', ' Aïn Defla', '44000'),
('45', ' النعامة', ' Naâma', '45000'),
('46', ' عين تيموشنت', ' Aïn Témouchent', '46000'),
('47', ' غرداية', ' Ghardaïa', '47000'),
('48', ' غليزان', ' Relizane', '48000'),
('49', ' تيميمون', ' Timimoun', '49000'),
('50', ' برج باجي مختار', ' Bordj Badji Mokhtar', '50000'),
('51', ' أولاد جلال', ' Ouled Djellal', '51000'),
('52', ' بني عباس', ' Béni Abbès', '52000'),
('53', ' عين صالح', ' In Salah', '53000'),
('54', ' عين قزام', ' In Guezzam', '54000'),
('55', ' تقرت', ' Touggourt', '55000'),
('56', ' جانت', ' Djanet', '56000'),
('57', ' المغير', ' El Meghaier', '57000'),
('58', ' المنيعة', ' El Menia', '58000')
ON CONFLICT ("Id") DO NOTHING;
