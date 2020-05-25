USE [master]
GO
/****** Object:  Database [LEnglishDB]    Script Date: 5/24/2020 4:20:07 PM ******/
CREATE DATABASE [LEnglishDB]
ALTER DATABASE [LEnglishDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LEnglishDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LEnglishDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LEnglishDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LEnglishDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LEnglishDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LEnglishDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LEnglishDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LEnglishDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LEnglishDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LEnglishDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LEnglishDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LEnglishDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LEnglishDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LEnglishDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LEnglishDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LEnglishDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LEnglishDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LEnglishDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LEnglishDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LEnglishDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LEnglishDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LEnglishDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LEnglishDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LEnglishDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LEnglishDB] SET  MULTI_USER 
GO
ALTER DATABASE [LEnglishDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LEnglishDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LEnglishDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LEnglishDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LEnglishDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LEnglishDB', N'ON'
GO
ALTER DATABASE [LEnglishDB] SET QUERY_STORE = OFF
GO
USE [LEnglishDB]
GO
/****** Object:  Table [dbo].[BaiTap]    Script Date: 5/24/2020 4:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiTap](
	[MaBaiTap] [nvarchar](20) NOT NULL,
	[TenBaiTap] [nvarchar](50) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[DanhMuc] [nvarchar](10) NULL,
	[MoTa] [nvarchar](max) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_bai_tap] PRIMARY KEY CLUSTERED 
(
	[MaBaiTap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BangDiem]    Script Date: 5/24/2020 4:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangDiem](
	[MaBangDiem] [int] NOT NULL,
	[MaBaiTap] [nvarchar](20) NOT NULL,
	[TenDangNhap] [nvarchar](30) NOT NULL,
	[SoCauHoi] [int] NULL,
	[SoCauDung] [int] NULL,
	[Diem] [float] NULL,
	[TinhTrang] [nvarchar](20) NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_bang_diem] PRIMARY KEY CLUSTERED 
(
	[MaBangDiem] ASC,
	[MaBaiTap] ASC,
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CapBac]    Script Date: 5/24/2020 4:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapBac](
	[MaCapBac] [nvarchar](20) NOT NULL,
	[TenCapBac] [nvarchar](30) NOT NULL,
	[MoTa] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_cap_bac] PRIMARY KEY CLUSTERED 
(
	[MaCapBac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CauHoi]    Script Date: 5/24/2020 4:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHoi](
	[MaCauHoi] [nvarchar](20) NOT NULL,
	[NoiDungCauHoi] [nvarchar](max) NULL,
	[CauTraLoi] [nvarchar](max) NULL,
	[DapAn] [nvarchar](max) NULL,
	[BaiTap] [nvarchar](20) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_cau_hoi] PRIMARY KEY CLUSTERED 
(
	[MaCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 5/24/2020 4:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [nvarchar](10) NOT NULL,
	[TenDanhMuc] [nvarchar](30) NOT NULL,
	[CapBac] [nvarchar](20) NULL,
	[MoTa] [nvarchar](100) NULL,
	[GhiChu] [nchar](100) NULL,
 CONSTRAINT [PK_danh_muc] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 5/24/2020 4:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] NOT NULL,
	[TenDangNhap] [nvarchar](30) NOT NULL,
	[MatKhau] [nvarchar](30) NOT NULL,
	[TenNguoiDung] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[NgaySinh] [datetime] NULL,
	[Email] [nvarchar](30) NULL,
 CONSTRAINT [PK_nguoi_dung] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BaiTap] ([MaBaiTap], [TenBaiTap], [NoiDung], [DanhMuc], [MoTa], [GhiChu]) VALUES (N'D-ILS4-1', N'Bài đọc 1 TOEI', N'Normally a student must attend a certain number of courses in order to graduate, and each course which he attends gives him a credit which he may count towards a degree. In many American universities the total work for a degree consists of three classes per week for fifteen weeks; while attending university a student will probably attend two terms each year. It is possible to spread to period of work for the degree over a longer period. It is also possible for a student to move between one university and another during his degree course, though this is not in fact done as a regular practice.
For every course that he follows a student is given a grade, which is recorded, and the record is useful for the student to show to coming employers. Most of the students feel the pressure of work, but in spite of this some students still find time for great activity in student affairs. The students are interested in elections to positions in student organization. The effective work of keeping orders is usually performed by students who advise the university authorities. Any student who is thought to have broken the rules, for example, by cheating has to appear before a student court. With the large numbers of students, the operation of the system includes a certain amount of activity. A student who has held one of these positions is much respected and it will be of importance to him later in his career.
', N'D-ILS4', NULL, NULL)
INSERT [dbo].[BaiTap] ([MaBaiTap], [TenBaiTap], [NoiDung], [DanhMuc], [MoTa], [GhiChu]) VALUES (N'D-ILS5-1', N'Bài đọc 1 ILS5', N'Most of us tend to think of production when we think of mass media industries. After all, it is the output of this production – the papers we read, the cable TV shows we watch – that grab our attention, make us happy or angry, interested or bored. Moreover, most public discussion about mass communication tends to be about production. The latest gossip about that actor will be in what film, the angry comments a mayor makes about the violence on local TV news, the newest CDs by an up-and-coming group – these are the kinds of topics that focus our attention on the making of content, not its distribution or exhibition.
Media executives know, however, that production is only one step in the arduous and risky process of getting a mass media idea to an audience. Distribution is the delivery of the produced material to the point where it will be shown to its intended audience. The activity takes place out of public view. We have already mentioned the NBC acts as a distributor when it disseminates television programming via satellite to TV stations. When Philadelphia Newspapers Inc. delivers its Philadelphia Inquirer to city newsstands, when Twentieth – Century – Fox moves its Musicland stores, they are involved in distribution to exhibitions.
', N'D-ILS5', NULL, NULL)
INSERT [dbo].[BaiTap] ([MaBaiTap], [TenBaiTap], [NoiDung], [DanhMuc], [MoTa], [GhiChu]) VALUES (N'D-ILS7-1', N'Bài đọc 1 ILS7', N'Like many other holidays, Halloween has evolved and changed throughout history. Over 2,000 years ago people called the Celts lived in what is now Ireland, the UK, and parts of Northern France. November 1 was their New Year''s Day. They believed that the night before the New Year (October 31) was a time when the living and the dead came together.
More than a thousand years ago the Christian church named November 1 All Saints Day (also called All Hallows.) This was a special holy day to honor the saints and other people who died for their religion. The night before All Hallows was called Hallows Eve. Later the name was changed to Halloween.
Like the Celts, the Europeans of that time also believed that the spirits of the dead would visit the earth on Halloween. They worried that evil spirits would cause problems or hurt them. So on that night people wore costumes that looked like ghosts or other evil creatures. They thought if they dressed like that, the spirits would think they were also dead and not harm them.
The tradition of Halloween was carried to America by the immigrating Europeans. Some of the traditions changed a little, though. For example, on Halloween in Europe some people would carry lanterns made from turnips. In America, pumpkins were more common. So people began putting candles inside them and using them as lanterns. That is why you see Jack ''o lanterns today.
These days Halloween is not usually considered a religious holiday. It is primarily a fun day for children. Children dress up in costumes like people did a thousand years ago. But instead of worrying about evil spirits, they go from house to house. They knock on doors and say "trick or treat." The owner of each house gives candy or something special to each trick or treater.
', N'D-ILS7', NULL, NULL)
INSERT [dbo].[BaiTap] ([MaBaiTap], [TenBaiTap], [NoiDung], [DanhMuc], [MoTa], [GhiChu]) VALUES (N'D-MVR1-1', N'Bài đọc 1 MVR1', N'On June 7 the company will hold its first worldwide videoconference. All twenty facilities will be linked by a satellite broadcasting system so that employees can see and speak with each other. Officials of the Zurich head office will begin the conference by telling us about their goals for the next ten years. Next, each facility manager will speak about current challenges. The last hour will be devoted to questions from the floor at all locations. Due to time differences, employees in Asia and South America will have to come to their broadcast facilities outside of regular business hours. Additional pay will be provided for them for this inconveniecnce. If this format proves productive, we hope to schedule wordwide and regional videoconferences periodically.', N'D-MVR1', NULL, NULL)
INSERT [dbo].[BaiTap] ([MaBaiTap], [TenBaiTap], [NoiDung], [DanhMuc], [MoTa], [GhiChu]) VALUES (N'D-MVR2-1', N'Bài đọc 1 MVR2', N'CHIEF INFORMATION OFFICER
We are one of the fastest-growing major health-care facilities in the country, with an immediate need for a Chief Information Officer. Our CIO is responsible for all information-systems activities, including systems analysis, management reporting, and computer function. This person sets information-systems policies, procedures, and technical standards and acts as a liaison between Information Services and other management departments. The ideal candidate has an advanced degree and 7 years’experience in health-care information systems, including at least 4 years of supervisory experience. Programming experience is not necessary, but experience with systems conversions is beneficial.
We offer a competitive salary and excellent benefits, along with the opportunity to work in a dynamic, growing organization. Please send resume with cover letter and salary history to:
University Medical Center
P.O. Box1234
Dubai, UAE
ATTN: Human Resources
Phone, fax, and e-mail applications will bot be processed.
', N'D-MVR2', NULL, NULL)
INSERT [dbo].[BaiTap] ([MaBaiTap], [TenBaiTap], [NoiDung], [DanhMuc], [MoTa], [GhiChu]) VALUES (N'D-STR1-1', N'Bài đọc 1 STR1', N'WASHINGTON – A government study released yesterday said that businesses should implement widespread commercial use of encryption, mathematical formulas to scramble electronic data, to curb the theft of computer data, wireless communications, and other electronic information. A committee of the government research council, which gives sciecnce and technology advice, said a broad use of encryption would help industries in many ways, including by making banking and telecommunications networks more secure and by giving people greater privacy. The committee also recommended that export controls on encryption technologies be progressively relaxed but not eliminated.', N'D-STR1', NULL, NULL)
INSERT [dbo].[BaiTap] ([MaBaiTap], [TenBaiTap], [NoiDung], [DanhMuc], [MoTa], [GhiChu]) VALUES (N'D-STR2-1', N'Bài đọc 1 STR2', N'March Motort Company Inc.
Fredriksdalsgatan 100 412 GS Goteborg, Sweden
Dear Customer:
The satisfaction and safety of all our customers are of prime concern to us. We are therefore contacting all owners of this year’s Meteor to alert them to improvements in the design of one of the car’s features. You may have noticed that the rear seat bells have a tendency to remain locked inside the retractors when the car is parked at a sharp angle, such as on a steep hill. Once the car is passengers are able to put on thier seat belts.
Our engineers have developed new parts for the retractors that significantly reduce this problem. It would be our pleasure to have new retractors installed for you at no charge. Simply bring our Meteor to the nearest Mach dealer and allow twenty-four hours, for installation. Once the improvemnet has been made, we are confident that your car’s seat belts will meet the highest standards for safety.
If you have any question, please contact your local dealer.
Sincerely yours,
(Signed)
Gunnar	Widengren
Vice President
', N'D-STR2', NULL, NULL)
INSERT [dbo].[BaiTap] ([MaBaiTap], [TenBaiTap], [NoiDung], [DanhMuc], [MoTa], [GhiChu]) VALUES (N'D-TEC35-1', N'Bài đọc 1 TEC35', N'Whales are mammals, so in many ways, they are just like human beings. The most important difference is that humans and whales live in different environments and whales have a special respiratory system that enables them to stay underwater for several minutes without breathing oxygen. For this reason, they are said to be voluntary breathers. That is, because of whales underwater environment, they must be conscious breathers. They think about every breath they take and come up to the surface of the water to breathe through blowholes on top of their heads.
What is outstanding about whales is the way they can sleep. While all mammals sleep, whales cannot afford to become unconscious for long because they may drown. The only way they can sleep is by remaining partially conscious. It is believed that only one hemisphere of the whale''s brain sleeps at a time, so they rest but are never completely asleep. They can do so most probably near the surface so that they can come up for air easily.
', N'D-TEC35', NULL, NULL)
INSERT [dbo].[BaiTap] ([MaBaiTap], [TenBaiTap], [NoiDung], [DanhMuc], [MoTa], [GhiChu]) VALUES (N'D-TEC50-1', N'Bài đọc 1 TOEIC500', N'Jean spent her first few years in Hooper and her family moved to Otsego early in her life. She was only ten when her father died unexpectedly, leaving her mother to raise and support their family alone. Her mother soon went to work outside the home to provide for the family, and Jean, being one of the oldest, had to help care for her younger siblings. Although she had much responsibility at home, Jean thoroughly enjoyed school and was an excellent student. She went on to graduate 10th in her class at Otsego High School in 1953.
While still in high school, Jean met a young man named Charles "Chuck" Holly, at a dance in Alamo; and they were quite taken with each other. Over the next few years, their love for each other blossomed and they were married on February 24, 1953, while Jean was still in school. At the time, Chuck was serving his country in the military, and had come home on leave to marry his sweetheart. Unfortunately, shortly thereafter, he was sent overseas to serve in Korea for the next fifteen months.
Upon his discharge, the couple settled into married life together in the Plainwell, Otsego area. To help make ends meet, Jean went to work at the collection bureau in Kalamazoo for a while, before taking a job at the cheese company in Otsego. In 1964, Chuck and Jean were overjoyed with the birth of their son, Chuck, who brought great joy into their lives. Jean remembered how her mother was always gone so much working after her father died and she did not want that for her son, so she left her job to devote herself to the role of a mother.', N'D-TEC50', NULL, NULL)
INSERT [dbo].[BaiTap] ([MaBaiTap], [TenBaiTap], [NoiDung], [DanhMuc], [MoTa], [GhiChu]) VALUES (N'D-TEC75-1', N'Bài đọc 1 TEC75', N'Fifty-five delegates representing all thirteen states except Rhode Island attended the Constitutional Convention in Philadelphia from May to September 1787. The delegates had been instructed by the Continential Congress to revise the old Articles off Confederation, but most believed that a strong central government was needed. There were differences, however, about what structure the government should take and how much influence large states should have. 
Virginia was by far the most populous state, wtih twice as many as people as New York, four times as many as New Jersey and ten times as many as Delaware. The leader of the Virginia delegation, James Madison, had already drawn up a plan for government, which become known as the Large State Plan. It is essence was that congressional representation would be based on population. It provided for two or more national executives. The smaller states feared that under this plan, a few large states would lord over the rest. New Jersey countered with the Small State Plan. It provided for equal representation for all states in a national legistature and for a singer national executive. Angry debate, heightened by a stifling heat wave, lead to deadlock. 
A cooling of tempers seemed to come with lower temperatures. The delegates harmmered out an agreement known as the Great Compromise - actually a bundle of shrewd compromises. They decided that Congress would consist of two houses. The larger states were granted representation based on population in the lower house, the House of Representatives. The smaller states were given equal representation in the upper house, the Senate, in which each state would have two senators regardless of population. It was also agreed that there would be a singer executive, the president. This critical compromise broke the logjam, and from then on, success seemed within reach. 
', N'D-TEC75', NULL, NULL)
INSERT [dbo].[BaiTap] ([MaBaiTap], [TenBaiTap], [NoiDung], [DanhMuc], [MoTa], [GhiChu]) VALUES (N'D-TEC90-1', N'Bài đọc 1 TEC90', N'The Empire State Building
Ever since it was built, the Empire State Building in New York has captured the attention and imagination of young and old alike. Every year millions of tourists head to the building to admire the view of the city from its observation floors, and it has appeared in countless films and television programmes. When it opened in 1931, it was the tallest building in the world. More than 80 years later, no other construction in New York, with the exception of the Statue of Liberty, is as famous.
Its construction began during an American race to the sky. This was probably inspired by the Eiffel Tower in Paris, which had been completed in 1889. However, while the Eiffel Tower was a remarkable construction, it did not serve any real purpose other than to impress. American architects wanted to not only go higher, but also give their towers a purpose. The idea of the practical skyscraper, with offices and apartments, was conceived, and by the early twentieth century, a skyscraper race was on. The Metropolitan Life Tower in 1909 was followed by the Woolworth Building in 1913 and then the Bank of Manhattan Building in 1929.
When John Raskob, one of New York’s most competitive businessmen, decided to join in the race to the sky, Walter Chrysler (one of Raskob’s biggest revals) was already building a skyscraper. Raskob was determined to build something higher. However, Chrysler was keeping the height of his building secret until it was complete, so Raskob had no idea how tall his own building would have to be in order to beat it. Risking everything, he hired an architect, William Lamb, to realize his dream. He gave him a very simple instruction: design a building that could be as tall as possible without collapsing.
Lamb drew up his plans. A certain amount of space in the centre, arranged as compactly as possible, would contain lifts and corridors. Surrounding this would be office spaces, which would become smaller the higher you went. It was simple but effective, and has remained the basic model for skyscrapers ever since. But was Lamb’s plan high enough to make the Empire State Building the tallest in the world? Initially, the plan included eighty storeys, but then Chrysler went higher, so another five storeys were added, making it just over a metre higher than Chrysler’s. Further alterations had to be made as Chrysler’s building rose even higher.
The competition between Raskob and Chrysler was fierce. After a while, Lamb was unable to add more storeys to his construction, but Raskob came up with a brilliant solution. After examining a model of the proposed building, Raskob said, “It needs a hat!” The new design for the Empire State Building, which also included a mast, would make the building 381 metres tall. The Chrysler Building was completed at 318 metres.
Building work started immediately, beginning with the assembly of steel girders which would form the building’s skeleton. At that time, different parts of buildings, such as girders, were made on the actual construction site before being put in place. This wasted valuable time, as construction workers had to wait for the parts to be made before they could start building with them. For Raskob’s structure, it was decided that the girders would be made in factories, then moved to the site. This was a much more efficient method, and would probably have pleased the efficiency-obsessed Raskob. He was, after all, a businessman, and was probably desperate to his new building to start making money as quickly as possible.
It is easy to imagine the effect the building would have had on passers-by as it rose from the ground. This was architecture on a truly grand scale, and even the sophisticated New Yorkers must have marveled at the sheer height and size of this remarkable new construction.
Once the first stage was complete, construction began on both the outside and inside of the building’s skeleton simultaneously. While bricks were being laid, electricians and decorators worked inside. The final part of the construction process was the installation of the lifts, which could travel and incredible 365 metres a minute.
The Empire State Building officially opened on 1 May, 1931. By today’s standards, it is not particularly attractive or elegant, especially when compared with modern skyscrapers in cities like Dubai and Shanghai. However, for its time, it was a remarkable monument to technology and ambition, and would remain the world’s tallest building for over 40 years.
Do the following statements agree with the views of the writer? Choose from the drop-down lists.
Choose: YES if the statement agrees with the views of the writer. NO if the statement contradicts the views of the writer. NOT GIVEN if it is impossible to say what the writer thinks about this.
', N'D-TEC90', NULL, NULL)
INSERT [dbo].[BangDiem] ([MaBangDiem], [MaBaiTap], [TenDangNhap], [SoCauHoi], [SoCauDung], [Diem], [TinhTrang], [GhiChu]) VALUES (1, N'D-TEC50-1', N'nbdat', 5, NULL, NULL, N'Unfinished', NULL)
INSERT [dbo].[BangDiem] ([MaBangDiem], [MaBaiTap], [TenDangNhap], [SoCauHoi], [SoCauDung], [Diem], [TinhTrang], [GhiChu]) VALUES (2, N'D-TEC50-1', N'nxhung', 5, 5, 10, N'Finished', NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'ILS4', N'IELTS 4.0', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'ILS5', N'IELTS 5.5', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'ILS7', N'IELTS 7.0', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'MVR1', N'Mover 1', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'MVR2', N'Mover 2', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'STR1', N'Starter 1', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'STR2', N'Starter 2', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'TEC35', N'TOEIC 350', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'TEC50', N'TOEIC 500', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'TEC75', N'TOEIC 750', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'TEC90', N'TOEIC 950', NULL, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-ILS4-1-1', N'1. According to the first paragraph an American is allowed ___.', N'to live in a different university/to take a particular course in a different university/to get two degree from two different university/to study at home', N'to take a particular course in a different university', N'D-ILS4-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-ILS4-1-2', N'2. Which of the following is useful for students’ future career?', N'an attendance record/a military record/an academic record/a disciplinary record', N'an academic record', N'D-ILS4-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-ILS4-1-3', N'3. American university students are usually under pressure of work because ___.', N'their university performance will affect their future careers/they are heavily involved in students affairs/they have to observe strict university regulations/they are interested in running for positions in student organizations', N'their university performance will affect their future careers', N'D-ILS4-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-ILS4-1-4', N'4. According to the last two sentences it’s important ___.', N'to take part in student organizations/to hold a position in student organizations/to be respected by members of student organizations/to run a student organization', N'to hold a position in student organizations', N'D-ILS4-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-ILS5-1-1', N'1. In this passage, "arduous" means___.', N'difficult/lucrative/lengthy/free', N'difficult', N'D-ILS5-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-ILS5-1-2', N'2. The passage states that people tend to focus on production because___.', N'it takes place out of public view/mass media companies do not own production divisions/the output of mass media is intended to grab our attention/companies can function as both producers and distributors', N'the output of mass media is intended to grab our attention', N'D-ILS5-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-ILS5-1-3', N'3. In this passage, to "disseminate" means to ___.', N'create/send out/take in/fertilize', N'send out', N'D-ILS5-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-ILS5-1-4', N'4. This passage states that distribution is___.', N'the first step in mass media production/the most talked-about step in mass media production/at least as important as production/not as important as exhibition', N'at least as important as production', N'D-ILS5-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-ILS5-1-5', N'5. The author''s purpose in writing this passage is to___.', N'tell an interesting story/define a concept clearly/describe a scene vividly/argue with the reader', N'define a concept clearly', N'D-ILS5-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-ILS7-1-1', N'1. The Celts thought the spirits of dead people returned to the earth on October 31st.', N'True/False', N'True', N'D-ILS7-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-ILS7-1-2', N'2. The Celts created All Hallows.', N'True/False', N'False', N'D-ILS7-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-ILS7-1-3', N'3. All Hallows is on October 31st.', N'True/False', N'False', N'D-ILS7-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-ILS7-1-4', N'4. The word Halloween comes from the word Hallows eve.', N'True/False', N'True', N'D-ILS7-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-ILS7-1-5', N'5. A thousand years ago Europeans wore costumes to get candy.', N'True/False', N'False', N'D-ILS7-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-MVR1-1-1', N'1. What will be the first agenda item at the conference?', N'Plans for a decade/Twenty-year goals/Present challenges/Quesions from employees', N'Plans for a decade', N'D-MVR1-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-MVR1-1-2', N'2. Why will some employees receive extra pay?', N'They must speak at the conference/The conference will take place before or after work/They must travel to other offices to attend/Their departments have met certain goals', N'The conference will take place before or after work', N'D-MVR1-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-MVR2-1-1', N'1. Who placed the advertisement?', N'A secretarial school/The Dubai chief information officer/A computer company/A hospital', N'A hospital', N'D-MVR1-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-MVR2-1-2', N'2. Which of these is required?', N'Programming experience/Ten years of work experience/Supervisory experience/A medical degree', N'Supervisory experience', N'D-MVR2-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-MVR2-1-3', N'3. What must an applicant submit?', N'An employment history/An application fee/Personal references/Medical records', N'Personal references', N'D-MVR2-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-MVR2-1-4', N'4. How should one apply?', N'In person/By fax/By mail/By e-mail', N'In person', N'D-MVR2-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-STR1-1-1', N'1. What does the study suggest businesses do?', N'Curb electronic information sharing/Use special technology to scramble electronic data/Progressively relax government export controls/Invest in government research', N'Use special technology to scramble electronic data', N'D-STR1-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-STR1-1-2', N'2. According to the article, how will the committee’s recommendations benefit businesses?', N'Science and technology advice will be available/Computer daa will be processed more quickly/Government resources will be shared/Telecommunications networks will be more secure', N'Telecommunications networks will be more secure', N'D-STR1-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-STR2-1-1', N'1. To whom is the letter addressed?', N'Mach Meteor owners/Mach service technicians/Mach parts department staff/Mach dealers', N'Mach Meteor owners', N'D-STR2-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-STR2-1-2', N'2. What is the propose of the letter?', N'To recommend seat belt use/To announce a parts improvement/To offer tips on parking/To advertise a new car model', N'To announce a parts improvement', N'D-STR2-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-STR2-1-3', N'3. What is the company offering for free?', N'An improved parking brake/A car seat cover/Front seat belts/A better retractor', N'A better retractor', N'D-STR2-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC35-1-1', N'1. Whales are like fish in the way they breathe.', N'True/False ', N'False', N'D-TEC35-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC35-1-2', N'2. Whales don''t sleep at all.', N'True/False ', N'False', N'D-TEC35-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC35-1-3', N'3. Whales sleep by letting the whole brain rest for a lapse of time.', N'True/False ', N'False', N'D-TEC35-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC50-1-1', N'1. Before Jean''s father passed away, her mother used to', N'work outside the home/be a housewife/support the family alone/work as a secretary', N'be a housewife ', N'D-TEC50-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC50-1-2', N'2. Which is not referred to Jean?', N'She was a responsible girl./She never helped her mother with household chores./She often did well at school./She went to high school.', N'She never helped her mother with household chores.', N'D-TEC50-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC50-1-3', N'3. Jean''s husband was a _______.', N'teacher/dancer/soldier/servant', N'soldier ', N'D-TEC50-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC50-1-4', N'4. Jean _______.', N'served in the military/lived in Korea for fifteen months/had a daughter/got married when she was a student', N'got married when she was a student', N'D-TEC50-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC50-1-5', N'5. Which is not true about Jean?', N'She disliked staying at home and taking care of her child./She worked outside the home before she had a child./She was very happy when she got a baby./She quit her job to look after her baby.', N'She disliked staying at home and taking care of her child.', N'D-TEC50-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC75-1-1', N'1. What is the main topic of this passage?', N'James Madison''s plan to create a stable structure for the government of the United States/A disagreement at the Constititional Convention and a subsequent compromise/The differences in population and relative power between the original states/The most important points of the Small State Plan', N'A disagreement at the Constititional Convention and a subsequent compromise', N'D-TEC75-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC75-1-2', N'2. According to the passage, how many states were represented at the Constututional Convention?', N'Twelve/Thirteen/Fourteen/Fifty-five', N'Twelve', N'D-TEC75-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC75-1-3', N'3. It can be inferred from the passage that the Articles of Confederation___.', N'Were supported by a majority of the delegates at the Convention/Were revised and presented as the Large State Plan/Allowed small states to dominate large ones/Provided for only a weak central government', N'Provided for only a weak central government', N'D-TEC75-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC75-1-4', N'4. According to the passage, in the 1787 which of the following states had the FEWEST people?', N'Virgina/Delaware/New York/New Jersey', N'Delaware', N'D-TEC75-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC75-1-5', N'5. In line 20, the phrase this plan refers to___.', N'The Small State Plan/a plan suggested by the national legislature/The Large State Plan/A compromise plan', N'The Large State Plan', N'D-TEC75-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC90-1-1', N'1. The Empire State Building is not as famous as the Statue of Liberty.', N'YES/NO/NOT GIVEN', N'YES', N'D-TEC90-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC90-1-2', N'2. It took courage for Raskob to begin work on his building without knowing how tall it would be', N'YES/NO/NOT GIVEN', N'YES', N'D-TEC90-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC90-1-3', N'3. Lamb’s plan for the building was very complicated.', N'YES/NO/NOT GIVEN', N'NO', N'D-TEC90-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC90-1-4', N'4. Raskob saved a lot of money by having the steel girders of his building made on the site.', N'YES/NO/NOT GIVEN', N'NOT GIVEN', N'D-TEC90-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [NoiDungCauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC90-1-5', N'5. The people of New York were impressed by Raskob’s building.', N'YES/NO/NOT GIVEN', N'YES', N'D-TEC90-1', NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-ILS4', N'Đọc ILS4', N'ILS4', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-ILS5', N'Đọc ILS5', N'ILS5', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-ILS7', N'Đọc ILS7', N'ILS7', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-MVR1', N'Đọc MVR1', N'MVR1', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-MVR2', N'Đọc MVR2', N'MVR2', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-STR1', N'Đọc STR1', N'STR1', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-STR2', N'Đọc STR2', N'STR2', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-TEC35', N'Đọc TEC35', N'TEC35', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-TEC50', N'Đọc TEC50', N'TEC50', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-TEC75', N'Đọc TEC75', N'TEC75', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-TEC90', N'Đọc TEC90', N'TEC90', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-ILS4', N'Nghe ILS4', N'ILS4', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-ILS5', N'Nghe ILS5', N'ILS5', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-ILS7', N'Nghe ILS7', N'ILS7', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-MVR1', N'Nghe MVR1', N'MVR1', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-MVR2', N'Nghe MVR2', N'MVR2', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-STR1', N'Nghe STR1', N'STR1', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-STR2', N'Nghe STR2', N'STR2', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-TEC35', N'Nghe TEC35', N'TEC35', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-TEC50', N'Nghe TEC50', N'TEC50', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-TEC75', N'Nghe TEC75', N'TEC75', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-TEC90', N'Nghe TEC90', N'TEC90', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'V-ILS4', N'Viết ILS4', N'ILS4', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'V-ILS5', N'Viết ILS5', N'ILS5', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'V-ILS7', N'Viết ILS7', N'ILS7', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'V-TEC35', N'Viết TEC35', N'TEC35', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'V-TEC50', N'Viết TEC50', N'TEC50', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'V-TEC75', N'Viết TEC75', N'TEC75', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'V-TEC90', N'Viết TEC90', N'TEC90', NULL, NULL)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [GioiTinh], [NgaySinh], [Email]) VALUES (1, N'nbdat', N'dat123', N'Ba Dat', N'Nam', CAST(N'1999-07-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [GioiTinh], [NgaySinh], [Email]) VALUES (2, N'dqminh', N'minh123', N'Dang Minh', N'Nam', CAST(N'1999-08-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [GioiTinh], [NgaySinh], [Email]) VALUES (3, N'dqdong', N'dong123', N'Quy Dong', N'Nam', CAST(N'1999-04-24T00:00:00.000' AS DateTime), N'quydong123@gmail.com')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [GioiTinh], [NgaySinh], [Email]) VALUES (4, N'nxhung', N'hung123', N'Xuan Hung', N'Nữ', CAST(N'1999-10-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [GioiTinh], [NgaySinh], [Email]) VALUES (5, N'vvnminh', N'minh123', N'Nhat Minh', N'Nam', CAST(N'1999-04-27T00:00:00.000' AS DateTime), NULL)
SET ANSI_PADDING ON
GO
/****** Object:  Index [u_tendangnhap]    Script Date: 5/24/2020 4:20:07 PM ******/
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [u_tendangnhap] UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [LEnglishDB] SET  READ_WRITE 
GO
