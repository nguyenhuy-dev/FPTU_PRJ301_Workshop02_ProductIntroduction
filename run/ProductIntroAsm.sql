USE [master]
GO

DROP DATABASE [ProductIntro]
GO
CREATE DATABASE [ProductIntro]
GO
ALTER DATABASE [ProductIntro] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductIntro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductIntro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductIntro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductIntro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductIntro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductIntro] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductIntro] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProductIntro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductIntro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductIntro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductIntro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductIntro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductIntro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductIntro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductIntro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductIntro] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProductIntro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductIntro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductIntro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductIntro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductIntro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductIntro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductIntro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductIntro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductIntro] SET  MULTI_USER 
GO
ALTER DATABASE [ProductIntro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductIntro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductIntro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductIntro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductIntro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductIntro] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProductIntro] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProductIntro] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProductIntro]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 4/10/2025 2:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[account] [varchar](20) NOT NULL,
	[pass] [varchar](20) NOT NULL,
	[lastName] [nvarchar](50) NULL,
	[firstName] [nvarchar](30) NOT NULL,
	[birthday] [datetime] NULL,
	[gender] [bit] NULL,
	[phone] [nvarchar](20) NULL,
	[isUse] [bit] NULL,
	[roleInSystem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 4/10/2025 2:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[typeId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](88) NOT NULL,
	[memo] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 4/10/2025 2:43:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[productId] [varchar](10) NOT NULL,
	[productName] [nvarchar](500) NOT NULL,
	[productImage] [varchar](max) NULL,
	[brief] [nvarchar](2000) NULL,
	[postedDate] [datetime] NULL,
	[typeId] [int] NOT NULL,
	[account] [varchar](20) NOT NULL,
	[unit] [nvarchar](32) NULL,
	[price] [int] NULL,
	[discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([account], [pass], [lastName], [firstName], [birthday], [gender], [phone], [isUse], [roleInSystem]) VALUES (N'admin', N'123', N'Nguyễn Quang', N'Hưng', CAST(N'1996-10-28T00:00:00.000' AS DateTime), 1, N'0705101028', 1, 1)
INSERT [dbo].[accounts] ([account], [pass], [lastName], [firstName], [birthday], [gender], [phone], [isUse], [roleInSystem]) VALUES (N'admin2', N'1234', N'Nguyễn Ngọc', N'Trâm', CAST(N'2003-06-11T00:00:00.000' AS DateTime), 0, N'0947474', 1, 1)
INSERT [dbo].[accounts] ([account], [pass], [lastName], [firstName], [birthday], [gender], [phone], [isUse], [roleInSystem]) VALUES (N'admin5', N'123', N'Hồ Quỳnh', N'Như', CAST(N'2005-05-12T00:00:00.000' AS DateTime), 0, N'094747', 1, 1)
INSERT [dbo].[accounts] ([account], [pass], [lastName], [firstName], [birthday], [gender], [phone], [isUse], [roleInSystem]) VALUES (N'manager', N'123', N'Nguyễn Minh', N'Quang', CAST(N'1996-06-12T00:00:00.000' AS DateTime), 1, N'0935694223', 0, 2)
INSERT [dbo].[accounts] ([account], [pass], [lastName], [firstName], [birthday], [gender], [phone], [isUse], [roleInSystem]) VALUES (N'manager1', N'1234', N'Trịnh Trung', N'Phong', CAST(N'2003-07-20T00:00:00.000' AS DateTime), 1, N'097979', 1, 2)
INSERT [dbo].[accounts] ([account], [pass], [lastName], [firstName], [birthday], [gender], [phone], [isUse], [roleInSystem]) VALUES (N'manager2', N'1234', N'Nguyễn Nhật', N'Minh', CAST(N'2003-07-25T00:00:00.000' AS DateTime), 1, N'097979777', 0, 2)
INSERT [dbo].[accounts] ([account], [pass], [lastName], [firstName], [birthday], [gender], [phone], [isUse], [roleInSystem]) VALUES (N'manager22', N'1234', N'Lê Thanh', N'Toàn', CAST(N'2003-08-18T00:00:00.000' AS DateTime), 1, N'09696996', 0, 2)
INSERT [dbo].[accounts] ([account], [pass], [lastName], [firstName], [birthday], [gender], [phone], [isUse], [roleInSystem]) VALUES (N'manager3', N'1234', N'Hồ Thảo', N'Nguyên', CAST(N'2005-09-09T00:00:00.000' AS DateTime), 0, N'09477474', 0, 2)
INSERT [dbo].[accounts] ([account], [pass], [lastName], [firstName], [birthday], [gender], [phone], [isUse], [roleInSystem]) VALUES (N'manager4', N'1234', N'Lâm Vân', N'Anh', CAST(N'2004-09-07T00:00:00.000' AS DateTime), 0, N'09515115', 0, 2)
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([typeId], [categoryName], [memo]) VALUES (1, N'Dụng cụ nhà bếp', N'')
INSERT [dbo].[categories] ([typeId], [categoryName], [memo]) VALUES (2, N'Điện gia dụng', N'')
INSERT [dbo].[categories] ([typeId], [categoryName], [memo]) VALUES (3, N'Trang trí nội thất', N'')
INSERT [dbo].[categories] ([typeId], [categoryName], [memo]) VALUES (4, N'Dụng cụ thể thao', N'')
INSERT [dbo].[categories] ([typeId], [categoryName], [memo]) VALUES (5, N'Thiết bị thông minh', N'')
INSERT [dbo].[categories] ([typeId], [categoryName], [memo]) VALUES (6, N'Quần - Áo thời trang', N'')
INSERT [dbo].[categories] ([typeId], [categoryName], [memo]) VALUES (28, N'Laptop', N'Đồ điện tử')
INSERT [dbo].[categories] ([typeId], [categoryName], [memo]) VALUES (30, N'Xe hai bánh', N'Phương tiện giao thông')
INSERT [dbo].[categories] ([typeId], [categoryName], [memo]) VALUES (31, N'Xe ba bánh', N'Phương tiện giao thông thô sơ')
INSERT [dbo].[categories] ([typeId], [categoryName], [memo]) VALUES (34, N'Sách vở', N'Bằng giấy')
INSERT [dbo].[categories] ([typeId], [categoryName], [memo]) VALUES (38, N'Khóa học online', N'Luyện thi Toán, Lí, Hóa, Sinh')
INSERT [dbo].[categories] ([typeId], [categoryName], [memo]) VALUES (39, N'Dịch vụ đưa đón tận nhà', N'Xe ôm, xe công nghệ')
INSERT [dbo].[categories] ([typeId], [categoryName], [memo]) VALUES (42, N'Sim, sóng, mạng', N'Cung cấp thuê bao người dùng')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'090909', N'Điện thoại iPhone 15 Pro Max 256GB', N'/images/sanPham/iPhone15ProMax.jpg', N'Smartphone xịn', CAST(N'2025-03-03T00:00:00.000' AS DateTime), 5, N'admin5', N'Chiếc', 25799000, 10)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'0947', N'Laptop ThinkPad X1', N'/images/sanPham/laptopThinkPadX1.jpg', N'Dòng laptop ngon, bền.', CAST(N'2025-03-08T00:00:00.000' AS DateTime), 28, N'admin5', N'Cái', 36880000, 3)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'09477947', N'Sim Vinaphone', N'/images/sanPham/simVinaphone.jpg', N'Sim cho data ngon, gọi tốt', CAST(N'2025-03-19T00:00:00.000' AS DateTime), 42, N'admin2', N'Thẻ', 150000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'0979792', N'Vợt cầu lông Passion', N'/images/sanPham/votCauLongPassion.jpg', N'Vợt cho dân chuyên. Bền, chắc, đầm và đẹp.', CAST(N'2025-03-05T00:00:00.000' AS DateTime), 4, N'manager1', N'Cây', 2430000, 7)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'09797979', N'Sim Viettel', N'/images/sanPham/simViettel.png', N'Sim có sóng siêu mạnh', CAST(N'2025-03-19T00:00:00.000' AS DateTime), 42, N'manager1', N'Thẻ', 200000, 10)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'10NOTEP256', N'Samsung Galaxy Note 10 Plus', N'/images/sanPham/samsungGalaxyNote10Plus.jpg', N'Sự kết hợp của những dải màu nổi bật và sinh động. Với lớp kính cường lực Gorilla 6 bảo vệ vững chắc, và chất liệu 
					  thủy tinh đánh bóng bắt sáng cao cấp sắc sảo kiến tạo nên ánh quang đậm chất đương đại.
					  Thao tác sử dụng Galaxy Note10 và Note10+ trực quan hơn nhờ Giao diện Đồng nhất, thân thiện với thói quen thường ngày, 
					  cho trải nghiệm Galaxy trở nên vô tận.', CAST(N'2025-02-25T14:53:20.940' AS DateTime), 5, N'admin', N'Cái', 25450000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'11MAX64213', N'Điện Thoại iPhone 11 Pro Max 64GB', N'/images/sanPham/iPhone11_ProMax.jpg', N'Điện thoại iPhone 11 Pro Max là phiên bản cao cấp nhất của iPhone năm nay. Sản phẩm có nhiều cải tiến nổi bật, hiệu năng, 
					  thiết kế mới đặc biệt ở phần mặt lưng và hệ thống camera.
						iPhone 11 Pro Max có rất nhiều cải tiến về thiết kế, điểm khác biệt lớn nhất đến từ phần mặt lưng với cụm camera được 
						thiết kế cách điệu khá to. ', CAST(N'2025-02-25T14:53:20.937' AS DateTime), 5, N'admin', N'Cái', 26500000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'1688993802', N'Áo Sơ Mi Nam Trơn Ngắn Tay', N'/images/sanPham/aoSoMiNamNganTay.jpg', N'Áo sơ mi nam body vẫn rất phù hợp để sử dụng thoải mái cho môi trường công sở. mẫu áo có thiết kế như thế này sẽ giúp các bạn nam thể hiện được sự tươi trẻ, năng động, thanh lịch và dễ dàng khoe được vóc dáng cân đối của cơ thể.
						Mẫu áo sơ mi nam body phù hợp và đẹp nhất khi được những chàng trai sở hữu thân hình săn chắc và thon gọn.', CAST(N'2025-02-25T14:53:20.933' AS DateTime), 6, N'admin', N'Chiếc', 99000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'2759614408', N'Giá để giày, Kệ Giày, kệ giầy dép - 7 tầng', N'/images/sanPham/keGiaDeGiay.jpg', N'Tủ Giày Gỗ Lắp Ráp 7 Tầng Cao Cấp với thiết kế nhỏ gọn, dễ dàng tháo lắp, đặc biệt có thể xếp lại cất gọn khi không sử dụng đến, tiết kiệm diện tích.
						Khung gỗ  melamine chống nước, có kèm bộ ốc vít để bạn có thể tự lắp ráp và tháo dỡ khi muốn di chuyển
						Kết cấu chắc chắn, bền bỉ, chịu lực tốt. Có thể để được 12 đôi giày dép và thêm ngăn kéo để chứa đồ nhỏ.
						Sản phẩm góp phần tạo nét hiện đại, sinh động cho không gian sống.', CAST(N'2025-02-25T14:53:20.920' AS DateTime), 3, N'admin', N'Cái', 439000, 10)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'4062373305', N'Ghế thư giãn', N'/images/sanPham/gheThuGian.jpg', N'Ghế làm chất liệu cao cấp, chắc chắn. Dùng ở văn phong, đi dã ngoại, ở nhà.
						Dễ dàng gấp gọn, Nằm cực sướng, giúp thư giãn lưng sau mỗi ngày làm việc', CAST(N'2025-02-25T14:53:20.917' AS DateTime), 3, N'admin', N'Cái', 699000, 10)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'4494738964', N'Balo Nữ Đi Học Laptop Chống Nước Ulzzang', N'/images/sanPham/baloNuChongNuoc.jpg', N'Thiết kế hiện đại, trẻ trung,tiện dụng,vừa đơn giản, vừa sang trọng. Sản phẩm chắc chắn.  Kích thước :BALO:40X12X30 CM', CAST(N'2025-02-25T14:53:20.933' AS DateTime), 6, N'admin', N'Cái', 105000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'5746333511', N'Kệ tivi phong cách Bắc Âu T350-1', N'/images/sanPham/keTiviPhongCachBacAu.png', N'Thiết kế đơn giản nhưng sắc nét, hiện đại, giúp trang trí nhà thêm ấn tượng tiết kiệm diện tích.
						Đa công năng: Sử dụng làm kệ tủ tivi ,kệ trang trí đa năng. 
						+ Kích thước:178x30x36cm. 
						+ Chất Liệu: Gỗ MDF nhập khẩu phủ melamin cao cấp chống xước chống nước tuyệt đối
						+ Màu sắc: Vân gỗ,Trắng hiện đại, nâu', CAST(N'2025-02-25T14:53:20.920' AS DateTime), 3, N'admin', N'Bộ', 569000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'6075086733', N'Áo thể thao Fitme Body Compression', N'/images/sanPham/aoTheThaoFitness.png', N'Áo thể thao Body Compression Fitme cao cấp chuyên nghiệp dành cho những ai có nhu cầu luyện tập với cường độ cao
						Phù hợp cho các môn thể thao tập gym, bóng rổ, bóng đá, bóng chuyền, giữ nhiệt. 
						Quần chất co dãn cao, fit cơ thể, tôn dáng người', CAST(N'2025-02-25T14:53:20.930' AS DateTime), 4, N'admin', N'Bộ', 152000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'6681948644', N'Váy Babaydoll Kẻ Caro Phối Nơ', N'/images/sanPham/vayBabadollCaro.jpg', N'Mẫu váy nhẹ nhàng tiểu thư cho các nàng bánh bèo vừa về kho Lê Sang nha!. Mã mới xưởng bên mới thiết kế chào hàng các nàng luôn ạ.
						+ Thiết kế cổ tròn phối nơ, đuôi cá.
						+ Vải đũi xốp trắng mịn dày dặn.', CAST(N'2025-02-25T14:53:20.930' AS DateTime), 6, N'admin', N'Cái', 109000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'7823080768', N'Tạ đeo chân cao cấp', N'/images/sanPham/taDeoChanCaoCap.jpg', N'Tạ đeo chân cao cấp phiên bản 4.0 - Nâng cao thể lực, giảm mỡ tăng cơ, phát triển chiều cao, sức bật và sức bền
					  Cấu tạo :
						+ Vải : Polyeste siêu bền có khả năng chống nước, khử mùi siêu thoáng và cực kỳ êm chân khi tập luyện.
						+ Thanh tạ : Thép không gỉ mạ crom cao cấp.	
						+ Trọng Lượng : 4 kg, 5 kg, 6 kg, 8 kg... có thể điểu chỉnh được trọng lượng.', CAST(N'2025-02-25T14:53:20.927' AS DateTime), 4, N'manager', N'Bộ', 315000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'8640589401', N'Xà Đơn Treo Tường', N'/images/sanPham/xaDonTreoTuong.jpg', N'Tập hít xà đơn hàng ngày sẽ giúp cho bạn có một thân hình cân đối, đẹp, vòng ngực rộng và cơ bắp săn chắn.
						Với việc tập xà đơn sẽ giúp bạn có một đôi tay cứng, chắc, khỏe.
						Tập hít xà đơn hàng ngày cũng sẽ giúp người tập giảm béo bụng một cách nhanh nhất và hiệu quả
						Xà đơn treo tường có thể thay đổi độ dài sao cho phù hợp với từng kích thước vị trí cần lắp đặt.', CAST(N'2025-02-25T14:53:20.930' AS DateTime), 4, N'manager', N'Bộ', 119000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'8709925437', N'Giày bốt da nam cao cổ', N'/images/sanPham/giayBotDaNamCaoCo.jpg', N'Giày da nam GD-08 với phong cách Bụi Bặm giúp bạn trở nên cá tính và ngầu hơn bao giờ hết, chất da tổng hợp cao cấp giúp bạn dùng lâu bên với thời gian
						Giày bốt nam GD-08 thiết kế giữa chất da và lớt vải lỗ thoáng khi nơi thân giày giúp chân bạn được thoáng khi hơn có 2 màu : Đen và Nâu', CAST(N'2025-02-25T14:53:20.937' AS DateTime), 6, N'manager', N'Đôi', 189000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'8868354221', N'Bàn Trà Sofa Phong Cách Bắc Âu - IGEA', N'/images/sanPham/banTraSofaIGEA.jpg', N'Mặt bàn sản xuất từ gỗ MDF phủ melamin cao cấp chống xước chống nước bề mặt sáng bóng. Chân bàn sản xuất từ gỗ sồi vân gỗ đều và đẹp.
					  Kích thước: mặt bàn rộng 50cm dài 90cm cao 42cm. Màu sắc: Trắng. Phong cách: Hiện đại', CAST(N'2025-02-25T14:53:20.917' AS DateTime), 3, N'manager', N'Cái', 290000, 5)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'9024218247', N'Máy chạy bộ trên không cao cấp', N'/images/sanPham/mayChayBoTrenKhong.jpg', N'Máy kết hợp tập luyện vừa chạy bộ, đi bộ vừa có thể tập kéo tay thúc đẩy các hệ cơ bắp chân, bắp tay, đùi, hông, mông, eo, bụng..
						Bàn để chân rộng, tạo thế đứng vững chắc, tay cầm bọc mút dày, tạo sự thoải mái cho người tập', CAST(N'2025-02-25T14:53:20.930' AS DateTime), 4, N'admin', N'Bộ', 1020000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'9680372888', N'Giày thể thao nữ', N'/images/sanPham/giayTheThaoNu.jpg', N'Kiểu dáng mới, mẫu mã đa dạng. Thể thao cá tính, đi chơi, đi thể dục đều đẹp ạ. Đế cao su, êm chân chống trơn trượt. Size 35 -39', CAST(N'2025-02-25T14:53:20.937' AS DateTime), 6, N'manager', N'Đôi', 153000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'994797', N'Vợt cầu lông SpaceSoul', N'/images/sanPham/votCauLongSpaceSoul.jpg', N'Vợt dành cho dân chuyên. Siêu nhẹ, đánh êm và chắc chắn.', CAST(N'2025-03-03T00:00:00.000' AS DateTime), 4, N'manager', N'Cây', 1375000, 11)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'AB0947B3', N'Tiểu thuyết Bố Già', N'/images/sanPham/tieuThuyetBoGia.jpg', N'Sách tiểu thuyết siêu lôi cuốn, hấp dẫn', CAST(N'2025-03-04T00:00:00.000' AS DateTime), 34, N'manager3', N'Cuốn', 250000, 20)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'BK105S2VWS', N'Máy giặt Toshiba Inverter', N'/images/sanPham/tuLanhToshiba.jpg', N'Máy Giặt Cửa Trước Inverter Toshiba TW-BK105S2V-WS (9.5kg) - Hàng Chính Hãng sở hữu kiểu thiết kế lồng ngang hiện đại, mang phong cách châu Âu cùng với gam màu trắng tinh tế, 
					  chắc chắn sẽ trở thành nội thất sang trọng cho không gian sống nhà bạn. Tiết kiệm điện năng. Khối lượng giặt: 9.5kg. Loại máy giặt: Cửa trước - lồng ngang. Tiết kiệm điện với công nghệ Inverter.', CAST(N'2025-02-25T14:53:20.920' AS DateTime), 2, N'manager', N'Bộ', 7390000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'EHE5224B-A', N'Tủ Lạnh ELECTROLUX Inverter 524 Lít ', N'/images/sanPham/tuLanhELECTROLUX.png', N'Làm mát 360 giúp giữ cho thực phẩm của bạn tươi và ngon lâu hơn bằng cách giảm thiểu biến động nhiệt độ. Bằng cách làm mát từng kệ riêng lẻ, nhiệt độ ổn định được duy trì.
					  Bộ lọc TasteLock Crisper với NutriPlus tạo ra một môi trường kín, ẩm để khóa các chất dinh dưỡng lâu hơn, giữ cho trái cây và rau quả của bạn tươi trong bảy ngày.', CAST(N'2025-02-25T14:53:20.927' AS DateTime), 2, N'manager', N'Bộ', 22590000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'NAFD10AR1B', N'Máy giặt Panasonic Inverter 10.5 Kg', N'/images/sanPham/mayGiatPanasonic.jpg', N'Giặt sạch các vết bẩn cứng đầu dễ dàng với công nghệ giặt Stainmaster, sở hữu công nghệ giặt Stainmaster, 
					  giúp giặt sạch các vết bẩn cứng đầu và tăng cường hiệu quả giặt sạch quần áo tốt hơn.', CAST(N'2025-02-25T14:53:20.923' AS DateTime), 2, N'manager', N'Bộ', 9290000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'NRF654GTX2', N'Tủ lạnh Panasonic Inverter 642 lít', N'/images/sanPham/tuLanhPanasonic.png', N'Tủ lạnh Panasonic Inverter 642 lít NR-F654GT-X2 với kiểu dáng 6 cửa, mặt gương cùng hệ thống khay kệ làm từ kính 
					  cường lực cứng cáp, không chỉ tô điểm vẻ đẹp đẳng cấp cho gian bếp mà còn giúp bạn thoải mái trong việc sắp xếp thực phẩm. 
					  Bên cạnh đó, tủ lạnh Panasonic 642 lít còn là sự lựa chọn lý tưởng cho gia đình trên 5 người.', CAST(N'2025-02-25T14:53:20.923' AS DateTime), 2, N'admin', N'Bộ', 88990000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'SHG2303MRA', N'Bộ nồi Inox 3 đáy SUNHOUSE', N'/images/sanPham/boNoiInoxSunhouse.jpg', N'Quai nồi Quai inox tán đinh bọc silicon cách nhiệt, Núm cầm Núm inox bọc silicon cách nhiệt, 
					  Vung nồi Vung kính cường lực viền inox, Đáy nồi Đáy từ, sử dụng trên mọi loại bếp', CAST(N'2025-02-25T14:53:20.910' AS DateTime), 1, N'manager', N'Bộ', 399000, 10)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'SHG2303TEF', N'Combo 2 Chảo chiên chống dính đáy Tefal', N'/images/sanPham/chaoChienTefal.jpg', N'LỚP PHỦ TITANIUM nonstick Bền chắc với hơn 16,000 lần chà nhám, mang lại khả năng chống dính tuyệt vời và độ bền vượt trội, 
					    có thể sử dụng ít dầu khi nấu ăn. Bên ngoài được phủ sơn chống dính, dễ dàng làm sạch. CÔNG NGHỆ THERMO-SPOT 
						Báo nhiệt thông minh, cho biết nhiệt độ lý tưởng để nấu ăn ngon.', CAST(N'2025-02-25T14:53:20.913' AS DateTime), 1, N'admin', N'Bộ', 709000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'XRN8012121', N'Xiaomi Redmi Note 8', N'/images/sanPham/XiaomiRedmiNote8.jpg', N'Điện Thoại Xiaomi Redmi Note 8 - Hàng Chính Hãng Không chỉ có 2 hay 3 camera mà với chiếc smartphone mới Xiaomi Redmi Note 8 thì người dùng sẽ có tới 4 camera 
					    để thỏa mãn nhu cầu chụp ảnh của mình.
					    Xiaomi Redmi Note 8 sở hữu cho mình camera chính với độ phân giải khủng "khủng" với "số chấm" lên tới 48 MP.', CAST(N'2025-02-25T14:53:20.940' AS DateTime), 5, N'manager', N'Cái', 3750000, 0)
INSERT [dbo].[products] ([productId], [productName], [productImage], [brief], [postedDate], [typeId], [account], [unit], [price], [discount]) VALUES (N'Y98HEAD802', N'Tai nghe bluetooth thể thao Y98', N'/images/sanPham/TaiNgheBluetoothY98.jpg', N'Nghe nhạc trong lúc tập luyện thể thao có thể giúp người tập quên đi cảm giác mệt mỏi và gia tăng thời gian tập luyện. 
					  Đồng thời, việc nghe nhạc cũng khiến con người quên đi sự chán nản, lặp đi lặp lại của các bài tập thể dục, từ đó gia tăng 
					  hiệu suất tập thể dục, thể thao. Chính vì vậy chiếc Tai nghe thể thao Bluetooth Y98 đang hot trên thị trường hiện nay chắc 
					  chắn sẽ làm bạn hài lòng.', CAST(N'2025-02-25T14:53:20.940' AS DateTime), 5, N'manager', N'Bộ', 299000, 0)
GO
ALTER TABLE [dbo].[accounts] ADD  DEFAULT ((1)) FOR [gender]
GO
ALTER TABLE [dbo].[accounts] ADD  DEFAULT ((0)) FOR [isUse]
GO
ALTER TABLE [dbo].[accounts] ADD  DEFAULT ((0)) FOR [roleInSystem]
GO
ALTER TABLE [dbo].[categories] ADD  DEFAULT ('') FOR [memo]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ('') FOR [productImage]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ('') FOR [brief]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (getdate()) FOR [postedDate]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (N'pcs') FOR [unit]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([account])
REFERENCES [dbo].[accounts] ([account])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([typeId])
REFERENCES [dbo].[categories] ([typeId])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD CHECK  (([discount]>=(0) AND [discount]<=(100)))
GO
USE [master]
GO
ALTER DATABASE [ProductIntro] SET  READ_WRITE 
GO
