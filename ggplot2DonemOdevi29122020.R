#*********************************Gamze ?dev************************************
data()
#aktif olmayan verisetlerini g?rmek i?in daha fazla veriseti 
data(package = .packages(all.available = TRUE))
#gglot2 k?t?phanesini ?a??rd?k
library(ggplot2)
#diamonds verisetini y?kledik
data("diamonds")
#dataframe olarak g?zlemliyoruz
df <- diamonds
#aes de?i?kenlerin ifade edildi?i k?s?m,geom_bar ,ise kat.de?.g?rsel. k?s?m

#barplot s?tun grafi?i kategorik de?i?kenler i?in kullan?l?r
ggplot(df, aes(cut)) + geom_bar()
#iki tane kat.de?i?keni g?rselle?tirmek istedi?imizde(cut-color)
#i?i?e s?n?fland?rmak istedi?imizde 
#position arg?man? ile anla??l?r g?rsel
ggplot(df, aes(cut,fill = color)) + geom_bar(position = position_dodge())
#grafi?e ba?l?k olu?turmak i?in fonksiyon ;
ggplot(df, aes(cut,fill = color)) + geom_bar(position = position_dodge()) + ggtitle("s?tun grafik ile g?rsel")
#sat?r ve s?tun isimlerini de?i?tirmek i?in fonksiyon ;
ggplot(df, aes(cut,fill = color)) + geom_bar(position = position_dodge()) + ggtitle("s?tun grafik ile g?rsel") +
  xlab("p?rlanta kalitesi") + ylab("g?r?lme s?kl?klar?")

#histogram ve yo?unluk grafikleri s?rekli de?i?kenler i?in kullan?l?r
#s?tunlar?n aral?klar? i?in binwidth)
ggplot(df,aes(price)) + geom_histogram(binwidth = 1000)
#yo?unluk grafi?i g?rmek i?in;
ggplot(df,aes(price)) + geom_density()
#yo?unluk ve histogram ayn? anda g?rselle?tirmek i?in ;(?l?eklerinin ayn? olmas? gerekmektedir)
ggplot(df,aes(price)) + geom_histogram(aes(y = ..density..)) + geom_density()
#bir kategorik ve bir s?rekli de?i?ken ile s?rekli de?i?ken k?r?l?m?nda histogram g?rselle?tirelim;
ggplot(df,aes(price, fill = cut)) + geom_histogram()
#?st?ste histogram ?ok anla??l?r de?il face_grid fonksiyonu ile par?alam?? olduk
ggplot(df,aes(price)) + geom_histogram() + facet_grid(cut ~. )





#*********************************Murat Caniklio?lu*****************************

# 6 ?lkenin (T?rkiye, Canada, Brezilya, M?s?r, ?sve? ve Hindistan) 
# Freedom House D?nya ?zg?rl?kler Raporu verilerini i?eri aktaral?m. 

#install.packages("dplyr")

#install.packages("ggplot2")

install.packages("gapminder")

library(dplyr) #veriyi manip?le ederken kullanaca??z

library(ggplot2) #veri g?rselle?tirme de kullanaca??m?z paket

library(gapminder) #Gapminder verilerinin bulundu?u veri paketi

colnames(gapminder) = c("ulke","kita","yil","yasam_suresi","nufus","kisi_basi_milli_gelir")

View(gapminder)

# ggplot(veriseti, aes(x, y))+geom_col() ? ?ubuk veya S?tun grafik i?in

# ggplot(veriseti, aes(x, y))+geom_line() veya geom_area() ? ?izgi veya Alan grafik i?in

# ggplot(veriseti, aes(x, y))+geom_point() ? Da??l?m grafi?i (scatter plot) i?in

ggplot(gapminder, aes(yil, yasam_suresi, fill = kita))+geom_col() #geom_col() ? ?ubuk veya S?tun grafik i?in

# x eksenine (yatay eksen) y?l de?i?kenini, y eksenine ya?am s?resini ekledik. 
# Grafi?e renk eklemek i?in fill arg?man?n? k?taya e?itledik.

# ya?am s?resi de?erlerini y???l? olarak toplad? ve g?rselle?tirdi. 
# Bizim istedi?imiz k?talar?n ya?am s?relerini birbirleriyle ayr? ayr? g?rselle?tirmek ve kar??la?t?rmakt?.
# bunu d?zeltmek i?in 

ggplot(gapminder, aes(yil, yasam_suresi, fill = kita))+geom_col(position = "dodge")


# ?izgi grafi?i i?in farkl? bir data y?kledik


dosya = 'c:/free.csv'
freedom <- read.csv(dosya)
freedom

ggplot(freedom, aes(y?l, puan, color = ?lke))+
  geom_line(size = 1.5)


#   <DA?ILIM GRAF???>  #  <SCATTERPLOT> 

# Sa??l?m Grafi?i iki de?i?ken aras?ndaki ili?kiyi g?stermek i?in kullan?l?r.

# Yapaca??m?z ?al??mada 2007 y?l?nda ya?am s?resi ile ki?i ba??na d??en milli gelir aras?ndaki 
# ili?kiyi k?talara g?re g?rselle?tirmek
# Ama bunun ?ncesinde elimizdeki veriyi 2007 y?l? kalacak ?ekilde filtreleyelim.


gapminder_2007 <-filter(gapminder, yil == 2007) 


# da??l?m grafi?inde goem_point() fonksiyonu ve renk i?in color arg?man? kullan?yoruz.
ggplot(gapminder_2007,aes(yasam_suresi,kisi_basi_milli_gelir, color = kita))+geom_point()


# Yine daha iyi bir g?rsel i?in veri noktalar?n?n b?y?kl???n? artt?ral?m ve ?effafl?k de?erini ayarlayal?m. 
# Noktalar?n b?y?kl???n? size, ?effafl??? ise alpha arg?manlar? ile ayarlayaca??z.

ggplot(gapminder_2007, aes(yasam_suresi,kisi_basi_milli_gelir, color = kita))+geom_point(size = 4, alpha = 0.7)

# Grafi?in Geli?tirlmesi

ggplot(gapminder_2007, aes(yasam_suresi,kisi_basi_milli_gelir, color = kita))+  geom_point(size = 4, alpha = 0.7) +
  labs(x="ya?am s?resi",
       y ="ki?i ba??na d??en milli gelir",
       title = "5 K?tada Ya?am S?resi ve Ki?i Ba??na D??en Milli Gelir ?li?kisi",
       subtitle = "Veri Kayna??: Gapminder, 2007", 
       caption = "Paket : GGPLOT2")


# Renk Se?imi
# link = https://colorbrewer2.org/#type=qualitative&scheme=Set1&n=5

# renk art?k bir de?er olarak yer al?yor. Renkleri grafi?e yans?tmak i?in +scale_color_manuel () fonksiyonu kullanaca??z.
# E?er ?ubuk grafikte bunu yap?yor olsayd?k scale_fill_manuel() kullanacakt?k.

renk <- c("#e41a1c","#377eb8","#4daf4a","#984ea3","#ff7f00")

ggplot(gapminder_2007, aes(yasam_suresi,kisi_basi_milli_gelir, color = kita))+  geom_point(size = 4, alpha = 0.7) +
  labs(x="ya?am s?resi",
       y ="ki?i ba??na d??en milli gelir",
       title = "5 K?tada Ya?am S?resi ve Ki?i Ba??na D??en Milli Gelir ?li?kisi",
       subtitle = "Veri Kayna??: Gapminder, 2007", 
       caption = "Paket : GGPLOT2")+
  scale_color_manual(values = renk)

# Facets ile birden fazla grafik olu?tural?m

# Ggplot2?daki facets ?zelli?i ile bir de?i?keni referans alarak tek seferde birden fazla grafik olu?turabiliriz. 
# Facets ?zelli?i sayesinde veri setini filtrelememize veya karma??k bir ?ekilde g?rselle?tirmemize gerek kalmayacak. 
# Bunu as?l koda ili?tirece?imiz facet_wrap() fonksiyonuyla yapaca??z.


ggplot(gapminder, aes(yil, yasam_suresi, fill = kita))+  geom_col(position = "dodge")+
  labs(x ="yil",y="yasam s?resi",
       title ="Son 50 y?lda 5 k?tada ya?am s?resinin de?i?imi", 
       subtitle = "Gapminder, 1952 -2007", 
       caption = "Paket : GGPLOT2")+
  scale_fill_manual(values = renk)+
  
  facet_wrap(~kita, ncol =5) 


# K?ta 5 ayr? de?i?kenden olu?tu?u i?in 5 ayr? grafik elde ettik. 
# ncol arg?man? ise g?rselin yan yana 5 ayr? grafik olmas?n? sa?lad?. 
# Dilersek 3 ?stte ve 2 altta bir grafik de elde edebilirdik. 


ggplot(gapminder, aes(yil, yasam_suresi, fill = kita))+  geom_col(position = "dodge")+
  labs(x ="yil",y="yasam s?resi",
       title ="Son 50 y?lda 5 k?tada ya?am s?resinin de?i?imi", 
       subtitle = "Gapminder, 1952 -2007", 
       caption = "Paket : GGPLOT2")+
  scale_fill_manual(values = renk)+
  
  facet_wrap(~kita, ncol =5) + facet_wrap(~kita, ncol = 3)


# da??l?m grafi?ini 2007 y?l?na g?re filtrelemi?tik
# bunun yerine facet ?zelli?i sayesinde her y?l? ayr? g?rselle?tirelim.

ggplot(gapminder, aes(yasam_suresi, kisi_basi_milli_gelir, color = kita))+  geom_point(size = 4, alpha = 0.7) +
  labs(x="ya?am s?resi",
       y ="ki?i ba??na d??en milli gelir",
       title = "5 K?tada Ya?am S?resi ve Ki?i Ba??na D??en Milli Gelir ?li?kisi",
       subtitle = "Gapminder, 1952-2007", 
       caption = "Paket : GGPLOT2")+
  scale_color_manual(values = renk)+
  facet_wrap(~yil, ncol = 6)
# Son 50 y?lda hem milli gelir hem de ya?am s?resi t?m k?talarda artm??. 
# K?talara bakal?m:

ggplot(gapminder, aes(yasam_suresi, kisi_basi_milli_gelir, color = kita))+  geom_point(size = 4, alpha = 0.7) +
  labs(x="ya?am s?resi",
       y ="ki?i ba??na d??en milli gelir",
       title = "5 K?tada Ya?am S?resi ve Ki?i Ba??na D??en Milli Gelir ?li?kisi",
       subtitle = "Gapminder, 1952-2007", 
       caption = "Paket : GGPLOT2")+
  scale_color_manual(values = renk)+
  facet_wrap(~yil, ncol = 6)+facet_wrap(~kita, ncol = 3)

# Grafi?in temas?n? de?i?tirelim

# grafi?in arka plan?, g?rselde kullan?lan font tipi, 
# font b?y?kl??? gibi bir ?ok ?geyi de ggplot2 paketinde belirleyebiliyoruz.
# bu grafik i?in theme_minimal() tercih ettik.

# Her seferinde tekrar u?ra?mamak ad?na ?u ana kadarki kodu dag?l?m_grafigi olarak tan?mlayal?m.

dagilim_grafigi <- ggplot(gapminder_2007, aes(yasam_suresi, kisi_basi_milli_gelir, color = kita))+geom_point(size = 4, alpha = 0.7) +
  labs(x="ya?am s?resi",
       y ="ki?i ba??na d??en milli gelir",
       title = "5 K?tada Ya?am S?resi ve Ki?i Ba??na D??en Milli Gelir ?li?kisi",
       subtitle = "Gapminder, 1952-2007", 
       caption = "Paket : GGPLOT2")+  scale_color_manual(values = renk)

dagilim_grafigi+theme_minimal()

# temay? de?i?tirmek istersek

theme_custom <- function() {
  theme_minimal() +
    theme(
      text = element_text(family = "Roboto", color = "gray25"),
      plot.title = element_text(face = "bold"),
      plot.subtitle = element_text(size = 11),
      plot.caption = element_text(color = "gray30"),
      plot.background = element_rect(fill = "gray95"),
      legend.position = "bottom",
      legend.title = element_blank()
    )
}

# son hali

dagilim_grafigi + theme_custom()



#-----------------------------------------------------------------------------#

# BOXPLOT  #

# 1  DE???KENLER ?ZER?NDEN OLU?TURULAN BOXPLOT GRAF???


# Datasetimiz R i?inde bulunan "mtcars"
# Kullanacak oldu?umuz de?i?kenler "drat" "Arka aks Oran?" - "wt" A??rl?k (1000 lbs(pound)) -> 1 lb 0.45 kg
library(ggplot2)
library(dplyr)
#library(caret)
View (mtcars)


# bu iki de?i?kenin boxplot grafi?ini ?izelim
# iki t?r boxplot kullan?m? var biri de?i?kenler ?zerinden di?eri ise form?ller ile 
# biz ?uan de?i?kenler ?zerinden boxplot u kullanaca??z.
# boxplot yazd?ktan sonra mtcars i?indeki drat ve wt de?i?kenlerini yazmam?z gerekiyor. bunu se?mek i?in [] kullan?l?r.

boxplot(mtcars[,c("drat" , "wt")])

# ?al??t?r?nca x eksenin de drat ve wt de?i?keni g?r?l?r. 
# y ekseninde ise x eksenin de yer alan de?i?kenlere ait de?erler vard?r.


boxplot(mtcars[,c("drat" , "wt" , "qsec")]) # de?i?ken de?erleri birbirine uzak olursa grafi?in okunmas? zorla??r bu
# bu nedenle de?i?kenleri buna uygunda se?ebiliriz. yada standartla?t?rma i?lemi yap?labilir.
# y eksinindeki de?erin artmas?n? istemiyorsak
boxplot(mtcars[,c("drat" , "wt")])

# Boxplot un Geli?tirilmesi 


# kolon isimlerini de?istirmek i?in names fonksiyonunu kullan?yoruz.
# ba?ka fonksiyonlarda bu de?i?ebilir.
# bir ?nceki ?rnekte iris i?in scatterplot u kullan?rken kolon isimlerini de?i?tirmek i?in
# colnames(iris)=c("Ta?_yapra??_Boyu","Ta?_yapra??_Eni","?anak_yapra??_boyu","?anak_yapra??_Eni","t?r?")

boxplot(mtcars[,c("drat" , "wt")],
        names = c("DRAT De?i?keni" , "WT De?i?keni")) 

# bu bir vekt?r olacak ve ilk eleman drat ikinci eleman wt yi temsil edecek

# Grafi?in Rengini de?i?tirmek i?in col fonksiyonunu kullan?yoruz.

boxplot(mtcars[,c("drat" , "wt")],
        names = c("DRAT De?i?keni" , "WT De?i?keni"),
        col = "orange" ) 

# grafikteki her de?i?kene farkl? renk vermek istiyorsak
# de?i?kenleri vekt?r i?erisinde yazaca??z

boxplot(mtcars[,c("drat" , "wt")],
        #  ba?l?k girmek i?in main
        main = "BOXPLOT Grafi?i" , 
        # x ve y eksen isimleri 
        xlab="Degiskenler", ylab="Degerler", 
        # de?i?ken isimlerini de?i?tirmek i?in kullan?yoruz
        names = c("DRAT De?i?keni" , "WT De?i?keni"), 
        # de?i?kenlere ait olan box lar?n renklendirmesi i?in kullan?yoruz.
        col = c("orange" ,"green"),
        # ?izgileri renklendirmek i?in border
        border =c("blue" , "black"),
        
        pch = 19 # noktalar?n i?ini doldurmak i?in 19 bi?imi de?i?tirmek i?in farkl? de?erler kullan?labilir.
) 


# boxplot grafiklerinin yorumlanmas?

# ba?ka bir durumdan daha s?z etmek gerekirse
# max de?erlerin ?zerinde kalan "Outliers" min ve max range in d???nda kalan de?erler
# grafi?e g?re iki tane ayk?r? de?erimiz oldu?unu s?yleyebiliriz.


boxplot(mtcars[,c("drat" , "wt")],
        main = "BOXPLOT Grafi?i" ,  
        xlab="Number of Cylinders", 
        ylab="Miles Per Gallon" ,
        names = c("DRAT De?i?keni" , "WT De?i?keni"), 
        col = c("orange" ,"green"),
        border =c("blue" , "black"),
        # range =  0,5,
        outline = FALSE # ayk?r? de?erleri g?rmek istemezsek outline de?erini kapatabilir yada range i de?i?tirebiliriz.
)

# boxplot grafikleri minimum ve maximum de?erleri g?sterir 
# ayn? zamanda 1. ?eyrek 3. ?eyrek ve medyan? (Ortanca) g?sterir.
# box ?n alt?ndaki ?izgi 1. ?eyrek ?st?ndeki ?izgi 3. ?eyrek ortadaki kal?n ?izgi ise medyan(ortanca) d?r.
# medyan (Ortanca) = 1, 1, 2, 2, "3", 4, 5, 5, 5 serisi medyan? 5. eleman 3 say?s?d?r.


# 2  FORM?LLER ?ZER?NDEN OLU?TURULAN BOXPLOT GRAF???

# form?l olu?turmak i?in ~ yakla??k sembol?n? kullan?yoruz.
# gear (vites) - ba??ms?z de?i?kenimiz olsun
# mpg de?erlerimizde ba??ml? de?i?kenimiz olsun
# g?rmek istedi?imiz boxplotu kullanarak gear de?i?keninin mpg de?i?kenine etkisini g?stermek.


# ba??ms?z de?i?ken olan cyl i sa? tarafa yani x eksenine yazaca??z

# ba??ml? de?i?ken olan mpg i sol tarafa yani y eksenine yazaca??z


boxplot(mpg~cyl,data=mtcars, main="Car Milage Data",
        xlab="Number of Cylinders", ylab="Miles Per Gallon",
        col = "orange",
        border ="blue")

# di?er i?lemleri yukarda yapt???m?z gibi de?i?tirerek grafi?i geli?tirebiliriz.









#*********************************Muhammet Sait DELEN***************************

#GEOM_POINT FONKSiyonu

#K?t?pphanemizi import ediyoruz.

library(ggplot2)
#data <- read.csv("/Users/admin/Desktop/telco-dataeng2.csv")

#R i?erisinde haz?r olarak y?kl? olan paketimizi import ediyoruz.
data(mtcars)

#Noktalar?n renklerini color komutuyla ayarlayabiliriz.


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

#Alfabetik s?raya g?re s?raralama i?lemi yapabiliriz.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

#Kategorik verilerde kullan?lmakla birlikte noktalar? ?effafla?t?rmaya yarar. 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

#Noktalar?n boyutlar?n? ve ?ekillerini de?i?tirebiliyoruz. (Ex:17 ??gen)

ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(size=2, shape=23)

#Noktalar?n boyutlar?n? g?rebiliyoruz.
ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point(aes(size=qsec))

#Noktalar? zenginle?tirip kenar boyutlar? ekliyoruz.
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point() + geom_rug()

# 2 boyutlu yo?unluk haritas? ??karabiliriz.

sp <- ggplot(faithful, aes(x=eruptions, y=waiting)) +
  geom_point()
sp + geom_density_2d()

# Noktalar?m?z? bir daire etraf?na alabiliriz. Bu daha derli toplu grafi?i 
#okumam?za yard?mc? olur.

ggplot(faithful, aes(waiting, eruptions))+
  geom_point()+
  stat_ellipse()

#GEOM-LINE FONKSIYONU#

#??e K?t?phanemizi import ederek ba?l?yoruz.

library(ggplot2)

#Verimiz hayvan?n di?inin uzamas? i?in verilen C vitamini dozlar?n? i?eriyor.
#Datay? import ediyoruz.

df <- data.frame(dose=c("D0.5", "D1", "D2"),
                 len=c(4.2, 10, 29.5))

#Standart temel bir ?izgi grafi?i ?izelim.

ggplot(data=df, aes(x=dose, y=len, group=1)) +
  geom_line()+
  geom_point()

#?izgimizin tipini de?i?tirebiliriz linetype komutuyla.

ggplot(data=df, aes(x=dose, y=len, group=1)) +
  geom_line(linetype = "dashed")+
  
  
  #Grafikteki ?izgimizin rengini de?i?tirebiliriz.
  
  ggplot(data=df, aes(x=dose, y=len, group=1)) +
  geom_line(color="red")+
  geom_point()
geom_point()





#*********************************Ahmet ?etinkaya*******************************


# ggplot ile ?s? haritas? (heatmap) ?izimi

library(ggplot2)
# melt()fonksiyonu i?in reshape2 k?t?phanesini y?kle
install.packages("reshape2")
library(reshape2)

data("mtcars")
View(mtcars)


# melt fonksiyonu degi?kenleri 2 s?tuna ay?r?r de?i?ken ad? ve de?eri
araba_verisi <- melt(mtcars)
View(araba_verisi)

# tabloda degi?ken olmayan ara? adlarini sutun olarak ekle
# mtcars'ta toplam 32 ara? i?in 11 degi?ken sutunu de?eri vard?r 
araba_verisi$araba <-rep(row.names(mtcars),11)
View(araba_verisi)

# s?tun adlar?n? t?rk?ele?tir
colnames(araba_verisi) = c("ozellikler", "deger", "araba")
View(araba_verisi)

# ?s? haritas?nda d???k de?erler i?in mavi y?ksek de?erler i?in k?rm?z? g?ster
dusukRenk = "white"
yuksekRenk = "darkred"


# ggplot() a veriyi y?kle
ggplot(araba_verisi)

# heatmap ?izimi eksenleri ve de?i?kenleri ?iz
ggplot(araba_verisi, aes(x = ozellikler, y = araba))

# sonra geom_tile() ile ?s? haritas?n? ?iz geom_tile kareli grafik ?izer
ggplot(araba_verisi, aes(ozellikler, araba)) + 
  geom_tile(aes(fill = deger)) 

# d???k ve y?ksek renkleri se?ti?imiz renklerimiz olarak de?i?tir
ggplot(araba_verisi, aes(ozellikler, araba)) + 
  geom_tile(aes(fill = deger)) +
  scale_fill_continuous(low = dusukRenk, high = yuksekRenk)

# her kutunun de?erini yaz
ggplot(araba_verisi, aes(ozellikler, araba)) + 
  geom_tile(aes(fill = deger)) +
  scale_fill_continuous(low = dusukRenk, high = yuksekRenk) +
  geom_text(aes(label = deger)) 

# grafi?in d?? etiketlerini ekle
ggplot(araba_verisi, aes(ozellikler, araba)) + 
  geom_tile(aes(fill = deger)) +
  scale_fill_continuous(low = dusukRenk, high = yuksekRenk) +
  geom_text(aes(label = deger)) +
  labs(x = "Arabalar?n ?zellikleri", y = "Araba Modeli", 
       title = "mtcars Is? Haritas?",
       subtitle = "?rnek ?s? haritas? grafi?idir",
       caption = "Veri seti: mtcar")

# tema ekle etiketleri renklendir ve a??s?n? degi?tir.
ggplot(araba_verisi, aes(ozellikler, araba)) + 
  geom_tile(aes(fill = deger)) +
  scale_fill_continuous(low = dusukRenk, high = yuksekRenk) +
  geom_text(aes(label = deger)) +
  labs(x = "Arabalar?n ?zellikleri", y = "Araba Modeli", 
       title = "mtcars Is? Haritas?",
       subtitle = "?rnek ?s? haritas? grafi?idir",
       caption = "Veri seti: mtcar") +
  theme_light() +
  theme(
    plot.title = element_text(color = "red", face = "bold"),
    plot.subtitle = element_text(color = "blue"),
    plot.caption = element_text(color = "brown",  face = "italic")) + 
  theme(axis.text.x=element_text(angle=90)) 

# ggsave ile kaydet.
# formatlar: "png",eps", "ps", "tex" (pictex), "pdf", "jpeg", 
#           "tiff", "png", "bmp", "svg" or "wmf"

p_arabagrafigi <- ggplot(araba_verisi, aes(ozellikler, araba)) + 
  geom_tile(aes(fill = deger)) +
  scale_fill_continuous(low = dusukRenk, high = yuksekRenk) +
  geom_text(aes(label = deger)) +
  labs(x = "Arabalar?n ?zellikleri", y = "Araba Modeli", 
       title = "mtcars Is? Haritas?",
       subtitle = "?rnek ?s? haritas? grafi?idir",
       caption = "Veri seti: mtcar") +
  theme_light() +
  theme(
    plot.title = element_text(color = "red", face = "bold"),
    plot.subtitle = element_text(color = "blue"),
    plot.caption = element_text(color = "brown",  face = "italic")) + 
  theme(axis.text.x=element_text(angle=90)) 
p_arabagrafigi

ggsave("p_arabagrafigi.png")
ggsave("p_arabagrafigi.pdf")
ggsave("p_arabagrafigi.jpg")




# CoordSf grubu geom_sf(), coord_sf() fonksiyonlar? ile harita ?izimi

# OpenStreetMaps (OSM) https://www.openstreetmap.org/copyright
# D?nyadaki t?m ?ehirler i?in veri i?erir
# Kullan?m? serbest ve a??k lisans alt?nda olan bir d?nya haritas?d?r
#
install.packages("osmdata")
install.packages("sf")
library(osmdata)
library(ggplot2)



# key value pair olarak t?m fiziksel nesneleri i?erir.
# yollar, restoranlar, okullar, d?kkanlar, nehirler, parklar,  
# trafik lambalar?, metro istasyonlar?..vs) i?erir.

# var olan ?zellikleri g?ster.
View(available_features())

# var olan ?zellikler alt?ndaki gruplar? g?rmek i?in - ?rn: d?kkanlar
# key - value
View(available_tags("shop"))


# getbb getboundingbox-> sehri se? x:boylam(longitude) y:enlem(latitude)
# [bbox:south,west,north,east]
izmir <- getbb("Izmir")
izmir

# izmirin u? koordinatlar?n? adland?r.
bati <- izmir[1,1]
dogu <- izmir[1,2]
guney <- izmir[2,1]
kuzey <- izmir[2,2]

# izmirdeki yerleri se?mek i?in https://rdrr.io/cran/osmdata/man/opq.html 
# Overpass API (OSM Server Side Scripting) openstreetmaps'in serverside API dir. 
# overpassquery opq() fonksiyonu ile istek clienta g?nderilir.
# default response XML olup, json ve csv deste?i vard?r.
sokaklar <- izmir %>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", 
                            "secondary", "tertiary")) %>%
  osmdata_sf()

# sokak bilgilerini g?ster
sokaklar

# izmirdeki kuyumcularin noktalar?n? belirle
kuyumcu <- izmir %>%
  opq()%>%
  add_osm_feature(key = "shop", 
                  value = c("jewelry")) %>%
  osmdata_sf()

kuyumcu

# izmirdeki metro istasyonlar?n?n noktalar?n? belirle 
metro_istasyonlari <- izmir %>%
  opq()%>%
  add_osm_feature(key = "station", 
                  value = c("subway")) %>%
  osmdata_sf()
metro_istasyonlari

#izmirin sokaklar?n?, kuyumcular?n? ve metro istasyonlar?n? haritada g?ster
#CoordSf grubu geom_sf(), coord_sf() ve statsf() fonksiyonlar? ile  basit noktalar, ?izgiler, poligonlar ?izilebilir.
#geom_sf'te inherit.aes = FALSE is defaultlar? uygulamaz. mesela ils?n?rlar?n? ?izmez. alfa artt?k?a koyuluk artar.


  #sokaklar? haritada g?stermek i?in sokaklar?n line olan verisini kullan
  ggplot() +
    geom_sf(data = sokaklar$osm_lines,
            inherit.aes = FALSE,
            color = "gray",
            size = .6,
            alpha = .6)
#ve izmirin koordinatlar? i?in sokaklar? haritada g?ster
  ggplot() +
    geom_sf(data = sokaklar$osm_lines,
            inherit.aes = FALSE,
            color = "gray",
            size = .6,
            alpha = .6) +
    coord_sf(xlim = c(bati, dogu), 
             ylim = c(guney, kuzey),
             expand = FALSE) 

#kuyumcular?n konumlar?n? nokta(point) olarak al ve sokaklarla beraber g?ster
  
  ggplot() +
    geom_sf(data = sokaklar$osm_lines,
            inherit.aes = FALSE,
            color = "gray",
            size = .6,
            alpha = .6) +
    geom_sf(data = kuyumcu$osm_points,
            inherit.aes = FALSE,
            color = "blue",
            size = 1,
            alpha = .8) +
    coord_sf(xlim = c(bati, dogu), 
             ylim = c(guney, kuzey),
             expand = TRUE) 
  
  
#metro istasyonlar?n? ekle
  ggplot() +
    geom_sf(data = sokaklar$osm_lines,
            inherit.aes = FALSE,
            color = "gray",
            size = .6,
            alpha = .6) +
    geom_sf(data = kuyumcu$osm_points,
            inherit.aes = FALSE,
            color = "blue",
            size = 1,
            alpha = .8) +
    geom_sf(data = metro_istasyonlari$osm_points,
            inherit.aes = FALSE,
            color = "red",
            size = 1.2,
            alpha = 1) +
    coord_sf(xlim = c(bati, dogu), 
             ylim = c(guney, kuzey),
             expand = FALSE) 
  

