-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2024 at 06:22 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `computer`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `created_at`, `updated_at`) VALUES
(2, 'Máy tính cũ giá rẻ', 'may-tinh-cu-gia-re', '2024-06-05 07:12:28', '2024-06-05 07:48:06'),
(3, 'Laptop', 'laptop', '2024-06-05 09:31:04', '2024-06-05 09:31:04'),
(4, 'Phụ kiện', 'phu-kien', '2024-06-05 09:31:16', '2024-06-05 09:31:16'),
(5, 'Máy bàn', 'may-ban', '2024-06-05 09:31:22', '2024-06-05 09:31:22'),
(6, 'Camera', 'camera', '2024-06-06 08:19:31', '2024-06-06 08:19:31'),
(7, 'Màng hình', 'mang-hinh', '2024-06-06 08:19:44', '2024-06-06 08:19:44');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_order` bigint(20) UNSIGNED NOT NULL,
  `id_product` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_prices` decimal(12,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `id_order`, `id_product`, `quantity`, `unit_prices`, `created_at`, `updated_at`) VALUES
(10, 8, 7, 1, 459000, '2024-06-07 11:33:06', '2024-06-07 11:33:06'),
(11, 8, 2, 1, 14990000, '2024-06-07 11:33:06', '2024-06-07 11:33:06'),
(12, 9, 7, 1, 459000, '2024-06-07 11:35:51', '2024-06-07 11:35:51'),
(13, 9, 2, 1, 14990000, '2024-06-07 11:35:51', '2024-06-07 11:35:51'),
(14, 10, 7, 1, 459000, '2024-06-07 11:37:47', '2024-06-07 11:37:47'),
(15, 10, 2, 1, 14990000, '2024-06-07 11:37:47', '2024-06-07 11:37:47'),
(16, 11, 7, 1, 459000, '2024-06-07 11:38:57', '2024-06-07 11:38:57'),
(17, 11, 2, 1, 14990000, '2024-06-07 11:38:57', '2024-06-07 11:38:57');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(13, '2024_06_01_150749_create_categories_table', 1),
(14, '2024_06_01_150924_create_products_table', 1),
(15, '2024_06_01_151012_create_orders_table', 1),
(16, '2024_06_01_151137_create_items_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `customer` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `total` decimal(12,0) NOT NULL,
  `status` enum('ordered','confirmed','completed') NOT NULL DEFAULT 'ordered',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `code`, `payment_status`, `customer`, `email`, `payment_type`, `phone`, `delivery_address`, `notes`, `total`, `status`, `created_at`, `updated_at`) VALUES
(8, NULL, 'OD-1359', 'thanh toán thành công', 'Nguyen Van Huynh', 'vanhuynh272001@gmail.com', 'THANH TOÁN VN PAY', '09028272', '123 Hồ Ngọc Lãm', NULL, 15449000, 'ordered', '2024-06-07 11:33:06', '2024-06-07 11:33:06'),
(9, NULL, 'OD-2128', 'thanh toán thành công', 'Nguyen Van Huynh', 'vanhuynh272001@gmail.com', 'THANH TOÁN VN PAY', '09028272', '123 Hồ Ngọc Lãm', NULL, 15449000, 'completed', '2024-06-07 11:35:51', '2024-06-07 05:07:54'),
(10, NULL, 'OD-1261', 'thanh toán thành công', 'Nguyen Van Huynh', 'vanhuynh272001@gmail.com', 'THANH TOÁN VN PAY', '09028272', '123 Hồ Ngọc Lãm', NULL, 15449000, 'completed', '2024-06-07 11:37:47', '2024-06-07 05:27:46'),
(11, NULL, 'OD-9736', 'thanh toán thành công', 'Nguyen Van Huynh', 'vanhuynh272001@gmail.com', 'THANH TOÁN VN PAY', '09028272', '123 Hồ Ngọc Lãm', NULL, 15449000, 'confirmed', '2024-06-07 11:38:57', '2024-06-07 05:07:46');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_category` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `info` longtext DEFAULT NULL,
  `des` longtext DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_prices` decimal(12,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `id_category`, `name`, `slug`, `image`, `info`, `des`, `quantity`, `unit_prices`, `created_at`, `updated_at`) VALUES
(1, 2, 'Laptop gaming MSI Thin 15 B13UC 2044VN', 'laptop-gaming-msi-thin-15-b13uc-2044vn', 'http://127.0.0.1:8000/img/46234_laptop_lenovo_legion_slim_5_16aph8_82y9002yvn_anphatpc.jpg', NULL, '<p>Trên thị trường máy tính hiện nay, tên tuổi của hãng <a href=\"https://www.anphatpc.com.vn/laptop-hp_dm1013.html\"><strong>Laptop HP</strong></a> có lẽ không còn xa lạ với chúng ta với những sản phẩm có độ bền cao, chất lượng tốt đáp ứng nhu cầu của người dùng. Trong bài viết này, An Phát Computer sẽ giới thiệu đến bạn một em laptop cực kỳ đáng sở hữu của dòng laptop đình đám này - <a href=\"https://www.anphatpc.com.vn/laptop-hp-240-g9-6l1x7pa.html\"><strong>Laptop HP 240 G9 6L1X7PA</strong></a>. Hãy cùng khám phá nhé!</p><p>&nbsp;</p><p><strong>Thiết kế sang trọng và cuốn hút</strong></p><p><strong>Laptop HP 240 G9 6L1X7PA </strong>được thiết kế gọn nhẹ với kích thước 32,4 x 22,59 x 1,99 cm, nặng chỉ đến 1,47 kg. Với thiết kế nhỏ gọn trên các bạn có thể mang em nó trong cặp sách của mình và đi bất cứ đâu nhằm thoả mãn nhu cầu sử dụng của mình, từ học tập, làm việc, cho đến giải trí, chơi game.</p><p><img src=\"https://anphat.com.vn/media/lib/29-08-2022/laptop-hp-240-g9-6l1y4pacore-i7-1255u--8gb--256gb--iris-x-graphics--14-inch-fhd--windows-11--bc-3.jpg\" alt=\"\"></p><p>Nắp lưng làm bằng kim loại màu bạc truyền thống, cùng với những đường nét hoàn thiện tinh tế tôn lên nét thanh lịch và sang trọng. Logo của hãng được in tròn sáng bóng tô điểm thêm sự đình đám của dòng laptop danh tiếng này.</p><h2><strong>Màn hình hiển thị sống động</strong></h2><p><strong>Laptop HP 240 G9 6L1X7PA </strong>sở hữu cho mình chiếc màn hình có độ phân giải full HD (1920x1080), rộng 14 inch. Độ sáng tối đa đạt 250 nits là mức độ sáng thông dụng, vừa phải trên các loại màn hình laptop hiện nay. Màn hình này cho chất lượng hiển thị vừa đủ, màu sắc hiển thị sắc nét, với góc nhìn rộng lên tới 178 độ từ màn hình <i>IPS</i> và an toàn cho mắt hơn với công nghệ <i>Anti-Glare</i>.</p><p><img src=\"https://anphat.com.vn/media/lib/29-08-2022/laptop-hp-240-g9-6l1y4pacore-i7-1255u--8gb--256gb--iris-x-graphics--14-inch-fhd--windows-11--bc-4.jpg\" alt=\"\"></p><p><strong>Cấu hình ổn định và mạnh mẽ</strong></p><p>Để có thể mang lại hiệu năng mạnh mẽ cũng như hỗ trợ bạn tối đa trong công việc, chiếc <strong>Laptop HP 240 G9 6L1X7PA</strong> đã được trang bị bộ vi xử lý Intel Core i3-1215U thế hệ thứ 12 đời mới nhất của dòng sản phẩm nhà Intel, gồm 6 nhân và 8 luồng, xung nhịp tối đa lên đến 4,40 GHz.</p><p>Bên cạnh đó, em <a href=\"https://www.anphatpc.com.vn/may-tinh-xach-tay-laptop.html\"><strong>laptop</strong></a> này cũng đã được trang bị card đồ họa tích hợp <i>Intel Iris Xe Graphics</i> cũng thuộc nhà Intel. Card đồ họa tích hợp này giúp thoả mãn nhu cầu giải trí, xem phim của người dùng với khả năng hỗ trợ hình ảnh độ phân giải cao, đem tới những thước phim sắc sảo và thực sự ấn tượng.</p><p>&nbsp;</p><p>Ngoài ra, bộ nhớ trong <i>8GB RAM DDR4</i> giúp bạn có thể xử lý đa tác vụ, giảm thời gian chờ đợi của bạn với tốc độ kết nối giữa RAM và bộ điều khiển lên đến 3200 MHz tương đương với hơn 25 GB/s. 2 khe cắm RAM phụ đi kèm giúp bạn có thể nâng khối lượng RAM của em laptop này nếu cảm thấy 8 GB là không đủ. Ổ cứng <i>256 GB SSD PCIe</i> giúp bạn bạn có thể khởi động máy hay các ứng dụng nhanh chóng và lưu trữ được nhiều hơn.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/29-08-2022/laptop-hp-240-g9-6l1y4pacore-i7-1255u--8gb--256gb--iris-x-graphics--14-inch-fhd--windows-11--bc-2.jpg\" alt=\"\"></figure><p><i><strong>Bàn phím và touchpad nhạy bén</strong></i></p><p>Bàn phím của em laptop này được thiết kế chắc chắn, sử dụng tone màu đen trẻ trung, hiện đại trên nền xám của thân máy. Sử dụng layout phím cắt giảm (không có bàn phím số) để phù hợp với kích thước của máy. Tuy nhiên không vì thế mà không thoả mãn nhu cầu sử dụng của các bạn khi vẫn giữ được đầy đủ các chức năng cần thiết. Khoảng cách các phím được thiết kế tiêu chuẩn với bàn phím máy tính để bàn giúp bạn có thể gõ văn bản hàng giờ mà không bị mỏi tay.</p><p>&nbsp;</p><p>Phần touchpad trơn và nhẵn, phím chuột trái và phải sâu và nhạy, bạn hoàn toàn có thể thao tác dễ dàng khi lướt ngón tay trên đó mà không cần sử dụng đến chuột rời.</p><p>&nbsp;</p><h2><i><strong>Đa dạng cổng kết nối</strong></i></h2><p>Thuộc dòng máy laptop văn phòng, nên <strong>Laptop HP 240 G9</strong> có đầy đủ các cổng kết nối cần thiết thoả mãn nhu cầu sử dụng của anh em văn phòng. Các cổng kết nối gồm:</p><ul><li>1x HDMI 1.4.</li><li>1x headphone/microphone combo 3,5mm.</li><li>2x SuperSpeed USB Type-A 5Gbps signaling rate.</li><li>1x SuperSpeed USB Type-C® 5Gbps signaling rate.</li><li>1x RJ45.</li></ul><p><img src=\"https://anphat.com.vn/media/lib/29-08-2022/laptop-hp-240-g9-6l1y4pacore-i7-1255u--8gb--256gb--iris-x-graphics--14-inch-fhd--windows-11--bc-1.jpg\" alt=\"\"></p><p>&nbsp;</p><p>&nbsp;</p><p><i>Nếu bạn có bất kỳ câu hỏi nào về <strong>Laptop HP 240 G9</strong>&nbsp;&nbsp;hãy để lại câu hỏi ngay bên dưới hoặc liên hệ ngay với đội ngũ chuyên viên tư vấn của An Phát Computer ngay nhé! Chúng tôi sẽ giúp bạn! <strong>(Hotline: 1900.0323 phím 6).</strong></i>&nbsp;</p>', 20, 17000000, '2024-06-05 08:16:34', '2024-06-05 09:17:52'),
(2, 3, 'Laptop Dell Vostro 3530 V5I5267W1 (Intel Core i5-1335U | 8GB | 256GB | 15.6 inch FHD 120Hz | Win 11 | Office | Xám)', 'laptop-dell-vostro-3530-v5i5267w1-intel-core-i5-1335u-8gb-256gb-156-inch-fhd-120hz-win-11-office-xam', 'http://127.0.0.1:8000/img/46600_laptop_dell_vostro_3530_v5i5267w1__1_.jpg', '<p>CPU: Intel Core i5-1335U (tối đa 4.60 GHz, 12MB)RAM: 8GB (1 x 8 GB) DDR4 3200Mhz ( 2 khe)Ổ cứng: 256GB SSD NVMeVGA: VGA: Intel Iris Xe Graphics có điều kiện khi sử dụng Dual RAM (với Ram 8GB : Intel UHD)Màn hình: 15.6 inch FHD (1920 x 1080) 120Hz 250 nits WVA Anti- Glare LED Backlit Narrow Border DisplayPin: 3 Cell, 41 WhCân nặng: 1.9 kgMàu sắc: XámOS: Windows 11 Home + Office Home and Student 2021</p>', '<h2><strong>Laptop Dell Vostro 3530 V5I5267W1</strong></h2><p><a href=\"https://www.anphatpc.com.vn/laptop-dell-vostro-3530-v5i5267w1.html\"><strong>Laptop Dell Vostro 3530 V5I5267W1</strong></a> là một sản phẩm công nghệ mới ra mắt từ Dell, hướng đến người dùng có nhu cầu làm việc và giải trí đa phương tiện. Với cấu hình mạnh mẽ và nhiều tính năng tiện ích, chiếc <a href=\"https://www.anphatpc.com.vn/laptop-dell-vostro_dm1620.html\"><strong>laptop Dell Vostro</strong></a> này&nbsp;là sự lựa chọn hoàn hảo cho sinh viên với thiết kế siêu mỏng và nhẹ, kèm theo nhiều tính năng ấn tượng giúp bạn nâng cao hiệu suất học tập và tận hưởng trải nghiệm game ưa thích.</p><p><img src=\"https://anphat.com.vn/media/lib/05-10-2023/laptopdellvostro3530v5i5267w13.jpg\" alt=\"\"></p><h2><strong>Thiết&nbsp;Kế Tinh Tế</strong></h2><p><strong>Laptop Dell Vostro 3530 V5I5267W1</strong> có thiết kế tối giản nhưng trang nhã, phù hợp với nhiều người dùng khác nhau. Với màu sắc xám truyền thống, máy mang đến một sự sang trọng và chuyên nghiệp.</p><p><img src=\"https://anphat.com.vn/media/lib/05-10-2023/laptopdellvostro3530v5i5267w16.jpg\" alt=\"\"></p><p>Kích thước tổng thể của máy là 359.9 x 240.2 x 19.9 mm, giúp máy trở nên nhẹ nhàng và dễ dàng cất giữ trong ba lô hoặc túi xách. Trọng lượng 1.9 kg cũng giúp bạn dễ dàng mang máy đi khắp nơi mà không cảm thấy nặng nề.</p><p><img src=\"https://anphat.com.vn/media/lib/05-10-2023/laptopdellvostro3530v5i5267w17.jpg\" alt=\"\"></p><p><a href=\"https://www.anphatpc.com.vn/may-tinh-xach-tay-laptop.html\"><strong>Máy tính xách tay</strong></a> này được làm từ chất liệu chắc chắn và độ bền cao. Vỏ máy có thiết kế tối giản với logo Dell ở góc trên bên trái của nắp máy. Logo được đặt một cách tinh tế và không quá nổi bật, tạo nên một vẻ đẹp đơn giản và thanh lịch.</p><p><img src=\"https://anphat.com.vn/media/lib/05-10-2023/laptopdellvostro3530v5i5267w12.jpg\" alt=\"\"></p><p>Bàn phím layout Fullsize cùng cụm phím numpad giúp bạn nhập liệu, soạn thảo văn bản và tính toán dễ dàng hơn. Thiết kế đặc biệt của các phím hạn chế sai sót khi đánh máy và tăng tốc độ.&nbsp;Các phím có hành trình sâu, cho phép bạn nhập liệu một cách nhanh chóng và chính xác. Bàn di chuột (touchpad) rộng và mượt, hỗ trợ đa chạm và các tính năng đặc biệt khác giúp bạn thao tác máy dễ dàng.&nbsp;</p><h2><strong>Cấu Hình Xử Lý Mọi Tác Vụ</strong></h2><p>Để đối phó với mọi nhiệm vụ từ học tập đến giải trí gaming,&nbsp;<a href=\"https://www.anphatpc.com.vn/laptop-dell_dm1012.html\"><strong>Laptop Dell</strong></a> này được trang bị bộ vi xử lý Intel Core i5-1335U, với tốc độ cơ bản lên đến 2.4 GHz và tối đa lên đến 4.60 GHz, cùng với bộ nhớ cache lên đến 12MB. Điều này đảm bảo máy có khả năng xử lý tốt các tác vụ đa nhiệm và ứng dụng đòi hỏi nhiều tài nguyên.</p><p><img src=\"https://anphat.com.vn/media/lib/05-10-2023/laptopdellvostro3530v5i5267w19.jpg\" alt=\"\"></p><p>RAM 8GB DDR4 3200MHz, được cấu hình 1 thanh 8GB, và hỗ trợ mở rộng lên đến 16GB với 2 khe cắm RAM. Điều này giúp máy chạy mượt mà các ứng dụng và không gặp tình trạng giật lag khi mở nhiều tab trình duyệt hoặc các ứng dụng nặng.</p><p>Ổ cứng SSD NVMe dung lượng 256GB, giúp tăng tốc độ truy cập dữ liệu và khởi động hệ điều hành nhanh chóng. Tuy dung lượng không lớn nhưng đây là ổ cứng lý tưởng để lưu trữ hệ điều hành và các ứng dụng quan trọng.</p><p>Với card đồ họa Intel Iris Xe Graphics, máy đáp ứng tốt nhu cầu xem phim, lướt web và làm việc với các ứng dụng văn phòng. Tuy nhiên, để tận dụng hết hiệu suất đồ họa, cần kết hợp với RAM Dual để sử dụng Intel UHD.</p><h2><strong>Màn Hình Mang Góc Nhìn Rộng</strong></h2><p>Màn hình có kích thước 15.6 inch, là một lựa chọn lý tưởng cho việc làm việc, giải trí và xem phim. Độ phân giải Full HD (1920 x 1080 pixels) đảm bảo hình ảnh sắc nét và chi tiết.&nbsp;Viền màn hình siêu mỏng giúp tối ưu hóa diện tích màn hình và tạo nên một thiết kế thẩm mỹ, giúp màn hình trông hiện đại và hấp dẫn hơn.</p><p><img src=\"https://anphat.com.vn/media/lib/05-10-2023/laptopdellvostro3530v5i5267w15.jpg\" alt=\"\"></p><p><strong>Tần số làm mới 120Hz</strong>&nbsp;giúp hình ảnh trở nên mượt mà hơn, đặc biệt khi bạn chơi game hoặc xem video chất lượng cao, trải nghiệm giải trí trở nên sống động hơn.Độ sáng 250 nits là một mức độ sáng tương đối tốt cho màn hình này. Nó cho phép bạn sử dụng máy tính ở nhiều môi trường ánh sáng khác nhau mà không gặp khó khăn. Màn hình sử dụng công nghệ WVA, giúp mở rộng góc nhìn và cho phép bạn xem hình ảnh từ nhiều góc độ khác nhau mà không bị mất màu sắc hoặc độ sáng.&nbsp;&nbsp;Tính năng chống chói giúp giảm bớt ánh sáng phản chiếu từ môi trường xung quanh, giúp bạn làm việc hoặc giải trí một cách thoải mái hơn mà không bị ánh sáng gây khó chịu.</p><h2><strong>Cổng Kết Nối Đa Dạng</strong></h2><p>Mặc dù có thiết kế siêu mỏng và nhẹ,&nbsp;<strong>Laptop Dell Vostro 3530 V5I5267W1</strong> vẫn trang bị đầy đủ cổng kết nối để bạn có thể kết nối với các thiết bị ngoại vi và phụ kiện khác để tối ưu hóa trải nghiệm.</p><p>1 cổng USB 3.2 Gen 1</p><p>1 cổng USB 2.0<br>1 cổng USB 3.2 Gen 1 Type-C<br>1 cổng USB 3.2 Gen 1 Type-C với chức năng DisplayPort Alt Mode 1.4/Power Delivery<br>1 cổng audio tổng hợp.</p><p><img src=\"https://anphat.com.vn/media/lib/05-10-2023/laptopdellvostro3530v5i5267w18.jpg\" alt=\"\"></p><p><a href=\"https://www.anphatpc.com.vn/laptop-cho-ke-toan.html\"><strong>Laptop cho kế toán</strong></a> này còn đi kèm với 1 cổng HDMI 1.4, giúp bạn kết nối máy tính với các thiết bị hiển thị ngoại vi như màn hình, TV hoặc máy chiếu.&nbsp;Máy được trang bị camera 720p at 30 fps HD và microphone tích hợp, giúp bạn thực hiện cuộc gọi video và họp trực tuyến một cách dễ dàng.</p><p><strong>Laptop Dell Vostro 3530 V5I5267W1</strong>&nbsp;với cấu hình mạnh mẽ, màn hình sắc nét, và nhiều tính năng tiện ích, là một lựa chọn phù hợp cho người dùng cần một <a href=\"https://www.anphatpc.com.vn/may-tinh-xach-tay-laptop.html\"><strong>laptop</strong></a>&nbsp;đáng tin cậy để làm việc và giải trí hàng ngày.&nbsp;</p>', 14, 14990000, '2024-06-05 09:25:40', '2024-06-05 09:35:20'),
(3, 3, 'Laptop Acer Aspire 7 A715-76-53PJ NH.QGESV.007 (Intel Core i5-12450H | 16GB | 512GB | Intel UHD | 15.6 inch FHD | Win 11 | Đen)', 'laptop-acer-aspire-7-a715-76-53pj-nhqgesv007-intel-core-i5-12450h-16gb-512gb-intel-uhd-156-inch-fhd-win-11-den', 'http://127.0.0.1:8000/img/product01.png', '<p>CPU: Intel Core i5-12450H (up to 4.4GHz, 12MB)RAM: 16GB (8x2) DDR4 3200MHz (2 slot, up to 32GB )Ổ cứng: 512GB PCIe NVMe SSDVGA: Intel® UHD GraphicsMàn hình: 15.6inch FHD (1920 x 1080) IPS SlimBezel, 60HzPin: 3-cell, 50WhCân nặng: 2.1kgMàu sắc: ĐenOS: Windows 11 Home</p>', '<h2><strong>Laptop Acer Aspire 7 A715-76-53PJ NH.QGESV.007</strong></h2><p><strong>Laptop Acer Aspire 7 A715-76-53PJ NH.QGESV.007</strong> sở hữu cấu hình mạnh mẽ với con chip Intel Core i5-12450H để vượt xa mọi đối thủ trong tầm giá và trở thành mẫu Laptop hàng đầu cho học sinh sinh viên cũng như dân văn phòng. Cùng tìm hiểu ngay về mẫu&nbsp;<a href=\"https://www.anphatpc.com.vn/laptop-acer-aspire_dm1630.html\">Acer Aspire</a> này ngay dưới đây.</p><h2><strong>Hiệu năng mạnh mẽ</strong></h2><p>Những mẫu Laptop tới từ Acer luôn nổi tiếng với những cấu hình mạnh mẽ vượt tầm giá, và&nbsp;<strong>Acer Aspire 7 A715-76-53PJ NH.QGESV.007</strong> cũng không phải là ngoại lệ khi được trang bị con chip đuôi H cực mạnh mẽ&nbsp;Intel Core i5-12450H. Hoạt động với 8 nhân 12 luồng, 12Mb Cache và mức xung nhịp Turbo lên tới 4.4Ghz,&nbsp;Intel Core i5-12450H dễ dàng xử lý mọi tác vụ làm việc học tập, làm việc thường ngày mà bạn cần tới. Con chip này cũng tích hợp đồ họa Onboard&nbsp;từ Intel để xử lý các tác vụ chỉnh sửa hình ảnh 2D hoặc để giải trí, chơi Game cơ bản.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/30-09-2023/acer_aspire_7_a715_0.jpg\" alt=\"\"></figure><p>Với việc được trang bị con chip H hiệu năng cao, chiếc Aspire 7 này cũng trang bị thêm viên Pin&nbsp;3-cell, 50Wh cung cấp đủ năng lượng cho máy hoạt động liên tục, không để gián đoạn công việc.</p><p>Điểm đáng chú ý không chỉ nằm ở CPU,&nbsp;<strong>Acer Aspire 7 A715-76-53PJ NH.QGESV.007</strong> còn sở hữu 16GB RAM DDR4 2x8 chạy ở kênh Dual Channel giúp tối đa lưu lượng băng thông để đạt hiệu quả đa nhiệm cao nhất. Ổ cứng dung lượng lớn&nbsp;512GB PCIe NVMe SSD có tốc độ đọc ghi siêu cao, thời gian mở máy, truy cập tệp, copy tệp,.. sẽ trở nên nhanh chóng hơn bao giờ hết. Nếu có nhu cầu lưu trữ nhiều hơn, bạn hoàn toàn có thể nâng cấp lên tới tối đa 1TB PCIe Gen 4.</p><h2><strong>Màn hình tiêu chuẩn</strong></h2><p>Mọi chi tiết sẽ được hiển thị rõ ràng, sắc nét trên chiếc màn hình 15.6Inch của&nbsp;<strong>Acer Aspire 7 A715-76-53PJ NH.QGESV.007</strong>. Màn hình lớn có độ phân giải 1920x1080 hiển thị tốt hình ảnh, video ở độ phân giải 1080p - Độ phân giải phổ biến nhất của phim ảnh ở thời điểm hiện tại. Sủ dụng tấm nền IPS khiến màu sắc hiển thị trên màn hình của chiếc Aspire 7 này trở nên rực rỡ và tươi sáng hơn hẳn từ mọi góc nhìn so với sử dụng tấm nền VA hay TN.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/30-09-2023/acer_aspire_7_a715_1.jpg\" alt=\"\"></figure><p>Acer quan tâm tới thị lực của người dùng bằng công nghệ Acer ComfyView bảo vệ đôi mắt của bạn khỏi những tác động tiêu cực từ ánh sáng màn hình.</p><h2><strong>Thiết kế tối giản</strong></h2><p>Đúng chất cho một mẫu Laptop văn phòng phục vụ cho nhu cầu học tập và làm việc,<strong>&nbsp;Acer Aspire 7 A715-76-53PJ NH.QGESV.007</strong> không quá màu mè và thiên về xu hướng tối giản với màu đên&nbsp;Charcoal lịch thiệp. Những phiên bản mới đây của dòng Aspire, Logo Acer không còn được đặt ở chính giữa mặt lưng nữa mà đã được thu gọn lại và di chuyển lên trên mép.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/30-09-2023/acer_aspire_7_a715_2.jpg\" alt=\"\"></figure><h2><strong>Kết nối toàn diện</strong></h2><p><strong>Laptop Acer Aspire 7 A715-76-53PJ NH.QGESV.007</strong>&nbsp;trang bị Wi-Fi chuẩn 6E mới nhất hoàn hảo cho nhu cầu chia sẻ dữ liệu tốc độ cao cùng chuẩn Bluetooth 5.1 cải thiện đáng kể chất lượng kết nối không dây. Ngoài ra chiếc&nbsp;Acer Aspire&nbsp;này cũng sở hữu rất nhiều cổng cắm vật lý khác nhau để tương thích với mọi thiết bị mà bạn muốn.</p><p>Nếu có bất kỳ thắc mắc nào về sản phẩm, hãy để lại câu hỏi bên dưới hoặc liên hệ ngay với đội ngũ chuyên viên tư vấn của <strong>An Phát Computer</strong> ngay nhé! <strong>(Hotline: 1900.0323 phím 6)</strong>.</p>', 20, 14990000, '2024-06-06 08:10:13', '2024-06-06 08:10:13'),
(4, 2, 'Laptop ASUS TUF Gaming A15 FA507NU-LP131W (Ryzen 5-7535HS | 16GB | 1TB | RTX 4050 6GB | 15.6-inch FHD | Win 11 | Jaeger Gray)', 'laptop-asus-tuf-gaming-a15-fa507nu-lp131w-ryzen-5-7535hs-16gb-1tb-rtx-4050-6gb-156-inch-fhd-win-11-jaeger-gray', 'http://127.0.0.1:8000/img/product03.png', '<p>CPU: AMD Ryzen 5-7535H (Upto 4.55GHz, 16MB)RAM: 16GB (2x8GB) DDR5 SO-DIMM (2 khe)Ổ cứng: 1TB PCIe 4.0 NVMe M.2 SSDVGA: NVIDIA GeForce RTX 4050 6GB GDDR6Màn hình: 15.6-inch FHD (1920 x 1080) 16:9, 144Hz, 250nits, 100% sRGB, Anti-glare displayPin: 4-cell 90WHrsCân nặng: 2.20 KgMàu sắc: Jaeger GrayOS: Windows 11 Home</p>', '<p><a href=\"https://www.anphatpc.com.vn/laptop-asus-tuf-gaming-a15-fa507nu-lp131w.html\"><strong>Laptop ASUS TUF A15 FA507NU-LP131W</strong></a>&nbsp;có thiết kế táo bạo và mạnh mẽ sẽ giúp bạn đa nhiệm nhiều hơn trên một chiếc&nbsp;<a href=\"https://www.anphatpc.com.vn/gaming-laptop.html\"><strong>laptop gaming</strong></a> đủ nhẹ để mang đi khắp mọi nơi.&nbsp;Chiếc laptop gaming này sở hữu cấu hình mạnh đáng mơ ước, đồng thời tích hợp nhiều thứ giúp cho những cuộc vui trong thế giới ảo của bạn thêm phần hoàn mỹ. Chỉ cần mở máy và thưởng thức những tựa game yêu thích, bạn sẽ thấy <strong>Asus TUF Gaming&nbsp;A15 FA507NU-LP131W</strong> mạnh như thế nào.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/20-10-2023/fx507zc4-hn095w1.jpg\" alt=\"\"></figure><h3><strong>Hiệu năng tuyệt vời&nbsp;</strong></h3><p>Luôn sẵn sàng cho mọi hành trình, <strong>Asus TUF&nbsp;A15 FA507NU-LP131W</strong> xử lý dễ dàng mọi tác vụ dù là chơi game, phát trực tiếp và hơn thế nữa. Sức mạnh CPU&nbsp;AMD&nbsp;Ryzen 5-7535HS&nbsp;phù hợp để giải trí và làm việc hàng ngày. Đồ họa nhanh và mượt mà với GPU NVIDIA GeForce RTX 4050 mang lại tốc độ khung hình cao ổn định. 16GB RAM DDR5-3200 RAM cho phép bạn đổi trang bị giữa trận một cách trơn tru. Đồng thời, ổ cứng SSD NVMe PCIe lên đến 512GB giúp đẩy nhanh thời gian tải trên tất cả các ứng dụng và trò chơi của bạn.</p><h3><strong>Màn hình 15.6 inch FHD IPS sắc nét</strong></h3><p>Chơi game tốc độ cao như game thủ chuyên nghiệp nhờ màn hình tấm nền IPS siêu nhanh với tần số quét lên đến 144Hz. Với Adaptive-Sync, tần số quét của màn hình đồng bộ với tốc độ khung hình của GPU để giảm thiểu hiện tượng giật, lag hay xé hình, cho trải nghiệm chơi game đắm chìm siêu mượt mà.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/20-10-2023/fx507zc4-hn095w-man-hinh1.jpg\" alt=\"\"></figure><h3><strong>Bàn phím cho độ chính xác tuyệt hảo</strong></h3><p>Thiết kế bàn phím của mẫu <a href=\"https://www.anphatpc.com.vn/laptop-asus_dm1058.html\"><strong>laptop</strong>&nbsp;<strong>ASUS </strong></a>này cho cảm giác gõ ổn định, nó giúp duy trì âm thanh khi gõ phím dưới 30dB cho bạn trải nghiệm riêng tư hơn. Bàn phím với bố cục như máy tính để bàn, có khoảng cách rộng giữa các phím chức năng, giúp bạn dễ dàng nhận diện và gõ chính xác. Đồng thời, các hotkey cho phép bạn dễ dàng thao tác các lệnh quan trọng. Hành trình phím 1,7mm cho phép thao tác nhấn phím nhẹ nhàng với khả năng tăng tốc độ gõ phím.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/20-10-2023/fx507zc4-hn095w-ban-phim.jpg\" alt=\"\"></figure><p>Bốn hotkeys chơi game chuyên dụng cho phép truy cập nhanh các chức năng như âm lượng, tắt tắt tiếng micro và tiện ích hệ thống Armoury Crate của chúng tôi. Bật micro để trao đổi chiến lược với đồng đội hoặc tăng âm lượng để nghe thấy từng chuyển động của kẻ địch đang ở gần mà không bị mất tập trung khỏi game.</p><h3><strong>Wi-Fi 6 siêu tốc độ</strong></h3><p>Kết nối Wi-Fi 6 (802.11ax) trên <strong>ASUS TUF&nbsp;Gaming A15 FA507NU-LP131W</strong> siêu nhanh cho phép bạn chơi game ở tốc độ LAN tại bất kỳ đâu có kết nối tương thích. Kết nối mạng nhanh hơn và hiệu quả hơn, điều này đặc biệt hữu ích tại các nơi đông đúc có lưu lượng truy cập lớn. Wi-Fi 6 cũng sử dụng cơ chế Target Wake Time cập nhật giúp kéo dài thời lượng pin và tiêu chuẩn bảo mật WPA3 giúp cải thiện bảo mật không dây.</p><h3><strong>Sạc Type-C đa dụng</strong></h3><p>Truyền điện năng qua USB hỗ trợ sạc thứ cấp từ pin sạc dự phòng di động, nhờ đó bạn không phải bận tâm tìm kiếm ổ điện khi pin yếu. Chiều ngược lại còn hỗ trợ sạc nhanh, sử dụng dòng điện lên đến 3A để nhanh chóng khôi phục nguồn điện cho điện thoại thông minh và các thiết bị khác. Nếu không sử dụng CPU hoặc GPU rời cho các tác vụ nặng, bạn có thể sử dụng bộ nguồn 100W nhỏ hơn để giảm tải khi di chuyển.</p><h3><strong>Thunderbolt 4 cho tốc độ kết nối nhanh</strong></h3><p>Với 4x lưu lượng đầu ra của USB 3.1, Thunderbolt 4 cho phép kết nối nhanh với rất nhiều thiết bị khác nhau. Sử dụng băng thông rộng để kết nối với GPU bên ngoài nhằm tăng sức mạnh đồ họa của bạn để chơi game đẳng cấp Ultra HD hoặc xử lý 3D. Kết nối với trạm sạc để tạo thiết lập như máy tính để bàn ở bất kỳ đâu. Hỗ trợ DisplayPort™ 1.4 cho phép bạn kết nối hai màn hình 4K ở 60Hz, hoặc một TV UHD 8K hoặc màn hình để có hình ảnh chân thực và đắm chìm.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/20-10-2023/fx507zc4-hn095w-cong-ket-noi.jpg\" alt=\"\"></figure><h3><strong>Độ bền đạt chuẩn quân đội</strong></h3><p>Để xứng đáng với tên gọi <a href=\"https://www.anphatpc.com.vn/asus-tuf-gaming-series_dm1821.html\"><strong>TUF Gaming</strong></a>, những chiếc laptop này phải vượt qua bài kiểm tra pin về độ bền chuẩn quân đội MIL-STD-810H. Các bài kiểm tra cho thiết bị bao gồm thả rơi và va đập, độ ẩm cao và nhiệt độ cực đoan nhằm đảm bảo độ laptop có thể hoạt động ổn định. Có thể vận hành ổn định ngay cả trong những môi trường khắc nghiệt nhất, <strong>ASUS TUF&nbsp;A15 FA507NU-LP131W</strong> có khả năng chống chịu những cú va đập và xóc nảy trong khi di chuyển.</p>', 20, 14990000, '2024-06-06 08:11:29', '2024-06-06 08:11:29'),
(5, 3, 'Laptop LG Gram 2023 16ZD90R-G.AX55A5 (Core i5-1340P | 16GB | 512GB | Intel Iris Xe | 16 inch WQXGA | Black)', 'laptop-lg-gram-2023-16zd90r-gax55a5-core-i5-1340p-16gb-512gb-intel-iris-xe-16-inch-wqxga-black', 'http://127.0.0.1:8000/img/product06.png', '<p>CPU: Intel Core i5-1340P (up to 4.6 GHz, 12MB)RAM: 16GB LPDDR5 (Dual Channel, 6000MHz)Ổ cứng: 512GB PCIe® NVMe™ M.2 SSDVGA: Intel Iris Xe GraphicsMàn hình: Màn hình: 16 inch WQXGA (2560 x 1600), 16:10, IPS Non Touch, 350nits, Anti-Glare, DCI-P3 99% (Thông thường), Tối thiểu 95%Pin: 80WhCân nặng: 1199gMàu sắc: BlackOS: Non-OS</p>', '<h2><strong>Laptop LG Gram 2023 16ZD90R-G.AX55A5</strong></h2><h2><strong>Siêu phẩm Laptop mỏng nhẹ</strong></h2><p><a href=\"https://www.anphatpc.com.vn/laptop-may-tinh-xach-tay-lg_dm1480.html\"><strong>LG Gram</strong></a>&nbsp;được biết đến như dòng Laptop cao cấp siêu mỏng nhẹ tới từ thương hiệu LG. Năm 2023, dòng sản phẩm đã quay trở lại với nhiều sự cải tiến mới. Cùng tìm hiểu về chiếc&nbsp;<a href=\"https://www.anphatpc.com.vn/laptop-lg-gram-2023-16zd90r-g.ax55a5.html\"><strong>Laptop LG Gram 2023 16ZD90R-G.AX55A5</strong></a>&nbsp;ngay dưới đây.</p><h2><strong>Siêu nhẹ nhưng siêu mạnh</strong></h2><p>Laptop mỏng nhẹ cùng với hiệu suất mạnh mẽ, LG gram mang đến cho bạn khả năng di động cao và năng suất làm việc tuyệt vời. Có trọng lượng 1.199Kg và kích thước&nbsp;35.51 cm x 24.23 cm x 1.68 cm,&nbsp;<strong>Laptop LG Gram 2023 16ZD90R-G.AX55A5</strong>&nbsp;lọt vào Top những chiếc&nbsp;<a href=\"https://www.anphatpc.com.vn/laptop-nho-gon_dm1615.html\"><strong>Laptop nhỏ gọn</strong></a> nhất thời điểm hiện tại.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/20-04-2023/kthuoc2.jpg\" alt=\"\"></figure><p>Dù ngoại hình trông có vẻ mỏng manh nhưng LG gram đã vượt qua 7 bài kiểm tra độ bền quân sự Mỹ MIL-STD-810H cực kỳ khắt khe. Được làm từ vật liệu siêu nhẹ nhưng bền - magnesium, laptop LG gram đảm bảo độ mạnh mẽ cũng như tính di động cao.</p><h2><strong>Màn hình sắc nét</strong></h2><p>Bạn sẽ bị quyến rũ trước màu sắc sống động và chân thực của hình ảnh hiển thị, bởi vì laptop LG gram được thiết kế với tỷ lệ khung hình 16:10, kích thước 16Inch, độ phân giải WQXGA(2560 x 1600) hỗ trợ gam màu rộng DCI-P3 99%, cho phép bạn xem được nhiều nội dung hơn mà không phải cuộn màn hình.</p><p>LG gram được trang bị tấm nền IPS chống lóa (Anti-Glare) cùng với độ sáng màn hình lên tới 350nits, giúp bạn thoải mái làm việc hay thưởng thức các thước phim giải trí ngoài trời hay tại những nơi có cường độ ánh sáng cao.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/20-04-2023/man16.jpg\" alt=\"\"></figure><h2><strong>Âm thành vòm sống động</strong></h2><p>Hệ thống âm thanh vòm được phát triển bởi&nbsp;Dolby Atmos cho phép bạn đắm chìm vào thế giới âm nhạc, phim ảnh chân thực và sống động.</p><figure class=\"image\"><img src=\"https://www.lg.com/vn/images/laptops/md07572497/features/pc-gram-14z90r-b-08-1-dolby-atmos-desktop.jpg\" alt=\"\"></figure><h2><strong>Công nghệ hiện đại nhất</strong></h2><p><strong>Laptop LG Gram 2023&nbsp;16ZD90R-G.AX55A5</strong>&nbsp;được trang bị những công nghệ tân tiến nhất thời điểm hiện tại, cho hiệu năng vượt trội.&nbsp;Máy được trang bị sức mạnh của chip Intel® Core™ thế hệ thứ 13 mới nhất để đáp ứng tất cả các nhu cầu xử lý rất nặng từ chơi game đến công việc sáng tạo.&nbsp;Core i5-1340P khiến mọi tác vụ trở nên đơn giản với 12 nhân, 16 luồng cho mức xung nhịp Turbo tối đa lên tới 4.6Ghz.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/20-04-2023/intel.jpg\" alt=\"\"></figure><p>16GB RAM DDR5 6000MHz và 512Gb SSD NVME Gen 4&nbsp;cho phép xử lý nhanh hơn để có được hiệu quả công việc và khả năng đa nhiệm cao hơn. Cả RAM DDR5 và SSD NVME Gen 4 đều là những bộ nhớ có tốc độ truyền tải nhanh nhất, công nghệ tân tiến nhất hiện tại.</p><h2><strong>Liên kết dễ dàng</strong></h2><p>Với phần mềm Intel® Unison™, giờ đây việc liên kết&nbsp; từ các thiết bị Android hoặc iOS với gram của bạn thật dễ dàng: chuyển file, gửi tin nhắn, thực hiện cuộc gọi..</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/20-04-2023/lg2.jpg\" alt=\"\"></figure><p><strong>Bảo mật an toàn</strong></p><p>Nhờ LG Security Guard ,Gram của bạn sẽ tự khóa và gửi cảnh báo khi phát hiện tình huống bất thường đảm bảo sự an toàn tuyệt đối cho thông tin cá nhân của bạn.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/20-04-2023/guard.jpg\" alt=\"\"></figure><h2><strong>LG Glance của Mirametrix®</strong></h2><p>Phần mềm LG Glance được phát triển bởi Mirametrix® giúp cảm biến khuôn mặt mắt, và ánh nhìn, giúp tăng cường bảo mật, giảm thiểu công việc và bảo vệ sức khỏe.&nbsp;</p><p>Tính năng của LG Glance:</p><p><strong>Bảo vệ và cảnh báo quyền riêng tư:</strong>&nbsp;Bảo vệ quyền riêng tư bằng cách tự động khóa gram hoặc làm mờ màn hình khi bạn rời khỏi máy tính xách tay hoặc người khác nhìn vào màn hình của bạn.</p><figure class=\"image\"><img src=\"https://www.lg.com/vn/images/laptops/md07572497/features/pc-gram-14z90r-b-12-4-1-privacy.jpg\" alt=\"Các tính năng riêng tư của Mirametrix®.\"></figure><p><strong>Điều khiển màn hình bằng cách theo dõi ánh mắt:</strong>&nbsp;Theo dõi ánh mắt của bạn và di chuyển con trỏ chuột tương ứng hoặc chuyển nội dung đang hoạt động sang màn hình bạn đang làm việc.</p><figure class=\"image\"><img src=\"https://www.lg.com/vn/images/laptops/md07572497/features/pc-gram-14z90r-b-12-4-2-screen-control.gif\" alt=\"Điều khiển màn hình bằng cách theo dõi ánh mắt của Mirametrix®.\"></figure><p><strong>LG gram quan tâm đến sức khỏe:</strong>&nbsp;Cảnh báo cho bạn khi bạn có một tư thế xấu cũng như khi bạn làm việc liên tục trong một thời gian dài.</p><figure class=\"image\"><img src=\"https://www.lg.com/vn/images/laptops/md07572497/features/pc-gram-14z90r-b-12-4-3-wellness-care.jpg\" alt=\"LG chăm sóc sức khỏe của Mirametrix®.\"></figure><p><strong>Hỗ trợ hội nghị trực tuyến:</strong>&nbsp;Chức năng này không chỉ giúp người xem có thể xem bản trình bày và tài liệu của bạn cùng một lúc mà còn cung cấp các chức năng tiện lợi như tự động tắt tiếng, cảnh báo tắt tiếng và camera ảo.</p><figure class=\"image\"><img src=\"https://www.lg.com/vn/images/laptops/md07572497/features/pc-gram-14z90r-b-12-4-4-videoconferencing.jpg\" alt=\"Các tính năng hội nghị truyền hình của Mirametrix®.\"></figure><h2><strong>Pin trâu, sử dụng cả ngày dài</strong></h2><p>Trải nghiệm khả năng di động không dây tối ưu với pin dung lượng cao 80Wh cho khả năng sử dụng lên tới tối đa 23.5H liên tục.</p><h2><strong>Hoạt động mát mẻ và êm ái</strong></h2><p>Làm việc và vui chơi với niềm đam mê nhưng vẫn giữ mát cho máy với hệ thống làm mát được cải tiến rất nhiều.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/20-04-2023/tannhiet.jpg\" alt=\"\"></figure><h2><strong>Kết nối linh hoạt</strong></h2><p>LG gram không chỉ cung cấp nhiều cổng khác nhau mà còn có hai cổng Thunderbolt™ 4 cho khả năng mở rộng tối ưu. Trải nghiệm màn hình 5k ở tốc độ truyền 40 GB trong khi sạc đồng thời các thiết bị bên ngoài.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/20-04-2023/lgram.jpg\" alt=\"\"></figure><p>&nbsp;</p><p>&nbsp;</p><h2><strong>Mở rộng màn hình chỉ bằng 1 nhấp</strong></h2><p>LG Display Extension cho phép bạn chỉ cần nhấp chuột theo hướng của màn hình thứ 2 và sử dụng màn hình này.</p><figure class=\"image\"><img src=\"https://www.lg.com/vn/images/laptops/md07572497/features/pc-gram-14z90r-b-16-1-1-2nd-display.gif\" alt=\"Hình động cho thấy màn hình dễ dàng mở rộng chỉ với một cú nhấp chuột.\"></figure><p>&nbsp;</p><h2><strong>Phím tắt tiện dụng</strong></h2><p>Giữ phím Fn hoặc Windows để hiển thị bản đồ phím tắt. LG gram được tải sẵn tất cả các phím tắt trực quan nhất.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/20-04-2023/fn.jpg\" alt=\"\"></figure><p>&nbsp;</p><p>Nếu bạn có bất kỳ câu hỏi nào về sản phẩm này hãy để lại câu hỏi ngay bên dưới hoặc liên hệ ngay với đội ngũ chuyên viên tư vấn của&nbsp;<strong>An Phát Computer</strong>&nbsp;ngay nhé! Chúng tôi sẽ giúp bạn!&nbsp;<strong>(Hotline: 1900.0323 phím 6)</strong></p>', 20, 20999000, '2024-06-06 08:13:16', '2024-06-06 08:13:16'),
(6, 4, 'Máy chơi game Asus ROG Ally RC71L-NH019W (AMD Ryzen Z1 | 16GB | AMD Radeon | 512GB | 7.0 inch FHD IPS | Win 11)', 'may-choi-game-asus-rog-ally-rc71l-nh019w-amd-ryzen-z1-16gb-amd-radeon-512gb-70-inch-fhd-ips-win-11', 'http://127.0.0.1:8000/img/product05.png', '<p>CPU: AMD Ryzen Z1 (6 nhân, 12 luồng, upto 4.9GHz, 6MB L2/ 16MB L3)RAM: 16GB LPDDR5 on boardGPU: AMD Radeon™ Graphics (AMD RDNA™ 3, 4 CUs, up to 2.5 GHz, up to 2.8 Teraflops)Ổ cứng: 512GB PCIe® 4.0 NVMe™ M.2 SSD (2230)Màn hình: 7.0 inch, FHD (1920 x 1080) 16:9, 120Hz, 500 nits 7ms, 100% sRGBPin: 40WHrs, 4S1P, 4-cell Li-ionCân nặng: 608gOS: Windows 11 Home</p>', '<h2><strong>Máy chơi game Asus ROG Ally RC71L-NH019W</strong></h2><p><a href=\"https://www.anphatpc.com.vn/may-choi-game-asus-rog-ally-rc71l-nh019w.html\"><strong>Máy chơi game Asus ROG Ally RC71L-NH019W</strong></a>&nbsp;là một tượng đài của hiệu năng di động, dự trên vi xử lý AMD Ryzen™ Z1 Series và kiến trúc Zen 4, mang đến trải nghiệm chơi game cầm tay đỉnh cao. Với hệ thống tản nhiệt Zero Gravity và màn hình Full HD 120Hz siêu mượt, máy chơi game này hứa hẹn đem đến sự hài lòng cho các game thủ khắp mọi nơi.</p><p><img src=\"https://anphat.com.vn/media/lib/31-10-2023/mychigameasusrogallyrc71l-nh019w3.jpg\" alt=\"\"></p><h2><strong>Đỉnh cao hiệu suất với vi xử lý AMD mới nhất</strong></h2><p>Sử dụng bộ vi xử lý Ryzen™ Z1 Series của AMD với 8 nhân và 16 luồng,&nbsp;Máy chơi game Asus ROG Ally RC71L-NH019W là một&nbsp;<a href=\"https://www.anphatpc.com.vn/gaming-gear.html\"><strong>Gaming Gear</strong></a>&nbsp;mạnh mẽ. Kiến trúc Zen 4 và đồ hoạ RDNA™ 3 cung cấp hiệu năng tuyệt vời cho tất cả các thể loại game. Từ những tựa game indie yêu thích cho đến bom tấn đồ hoạ AAA, ROG Ally luôn sẵn sàng cùng bạn.&nbsp;</p><p><img src=\"https://anphat.com.vn/media/lib/31-10-2023/mychigameasusrogallyrc71l-nh019w4.jpg\" alt=\"\"></p><h2><strong>Hệ thống tản nhiệt Zero Gravity và Màn hình FHD 120Hz tuyệt đẹp</strong></h2><p><strong>Máy chơi game Asus ROG Ally RC71L-NH019W&nbsp;</strong>được trang bị công nghệ tản nhiệt Zero Gravity mới nhất của ROG, với hai quạt tản nhiệt, lá đồng siêu mỏng và ống đồng che phủ toàn diện. Điều này đảm bảo máy luôn mát mẻ và ổn định trong bất kỳ tình huống nào khi bạn chơi game.</p><p><img src=\"https://anphat.com.vn/media/lib/31-10-2023/mychigameasusrogallyrc71l-nh019w1.jpg\" alt=\"\"></p><p>Màn hình Full HD 120Hz đẹp không chỉ về độ phân giải mà còn về khả năng chống xé hình với công nghệ FreeSync™ Premium. Độ sáng 500 nits giúp bạn thoải mái chơi game trong mọi điều kiện ánh sáng. Cảm ứng đa điểm cho phép bạn tùy biến và điều khiển nhanh chóng.</p><h2><strong>Trải nghiệm mượt mà trên Windows 11 Home</strong></h2><p>Máy chơi game Asus ROG Ally RC71L-NH019W sử dụng Windows 11 bản quyền, giúp bạn truy cập dễ dàng các nền tảng game và streaming phổ biến như Steam, Origin, EpicGames và PC Game Pass. Giao diện được tùy chỉnh riêng cho máy chơi game cầm tay, với khả năng điều khiển bằng các phím trên tay cầm hoặc màn hình cảm ứng.</p><p><img src=\"https://anphat.com.vn/media/lib/31-10-2023/mychigameasusrogallyrc71l-nh019w5.jpg\" alt=\"\"></p><p>Phiên bản đặc biệt của Armoury Crate dành cho&nbsp;<strong>Máy chơi game Asus ROG Ally RC71L-NH019W</strong> giúp bạn kiểm soát hiệu năng, công nghệ nội suy hình ảnh AMD FidelityFX Super Resolution và AMD Radeon Super Resolution, tần số quét, và nhanh chóng khởi động các tựa game.&nbsp;</p><h2><strong>Thiết kế công thái học và trọng lượng siêu nhẹ</strong></h2><p><strong>Máy chơi game Asus ROG Ally RC71L-NH019W</strong>&nbsp;được thiết kế để đảm bảo sự tiện dụng và sử dụng thoải mái suốt cả ngày. Với trọng lượng siêu nhẹ chỉ 608g, bạn có thể dễ dàng mang theo trong balo hoặc túi xách mà không gặp khó khăn.&nbsp;Thiết kế công thái học từ khu vực báng cầm tay giúp chống trơn trượt và mang lại cảm giác cầm nắm chắc chắn.</p><p><img src=\"https://anphat.com.vn/media/lib/31-10-2023/mychigameasusrogallyrc71l-nh019w2.jpg\" alt=\"\"></p><p>Máy chơi game Asus ROG Ally RC71L-NH019W&nbsp;của Asus có thiết kế trọng lượng siêu nhẹ, chỉ khoảng 600 gram. Máy gồm màn hình cảm ứng lớn và hai cụm tay cầm điều khiển nghiêng nhẹ. Với vỏ sơn trắng và mặt lưng nhám, ROG Ally mang lại cảm giác cao cấp và không gây mệt mỏi.</p><p>Mặt lưng có logo thiết kế độc đáo để tăng độ nhận diện và đảm bảo tản nhiệt hiệu quả.</p><h2><strong>Pin trâu để chơi game thoải mái</strong></h2><p><a href=\"https://www.anphatpc.com.vn/tay-cam-choi-game.html\"><strong>Tay cầm chơi game</strong></a>&nbsp;có pin 40 Whs, cho phép chơi game, xem phim, lướt web trong thời gian dài. Dù bạn chơi tựa game AAA, thời gian chờ sạc ngắn giúp bạn trở lại trò chơi nhanh chóng.</p><p><img src=\"https://anphat.com.vn/media/lib/31-10-2023/mychigameasusrogallyrc71l-nh019w4.jpg\" alt=\"\"></p><p><strong>Máy chơi game Asus ROG Ally RC71L-NH019W</strong>&nbsp;không chỉ mang theo sự nhẹ nhàng và tiện dụng, mà còn mang theo sức mạnh đáng kinh ngạc để thách thức mọi tựa game. Với hiệu năng siêu khủng và màn hình siêu mượt, bạn sẽ sẵn sàng để chinh phục thế giới game di động. Đừng để bất kỳ tựa game cản bước chân bạn, hãy để&nbsp;Asus ROG Ally RC71L-NH019W dẫn đường đến chiến thắng!</p><p><br>&nbsp;</p>', 20, 13990000, '2024-06-06 08:15:24', '2024-06-06 08:15:24'),
(7, 4, 'Webcam Logitech HD C270', 'webcam-logitech-hd-c270', 'http://127.0.0.1:8000/img/shop02.png', '<p>Bộ cảm biến ảnh HD (1280 x 720 pixels). Chụp ảnh tĩnh 3 megapixels. Tốc độ hình bắt hình lên đến 30 hình/giây.Tích hợp 1 Micro ứng dụng công nghệ RightSound cho âm thanh rõ ràng và trong veo.Ứng dụng công nghệ Righ Light - tự động điều chỉnh để lấy được ánh sáng tối ưu, và cho ảnh tốt ngay cả trong điều kiện ánh sáng mập mờ.Chân đế có thể gắn được trên màng hình CRT và LCD</p>', '<h2><a href=\"https://www.anphatpc.com.vn/webcam-logitech-hd-c270_id18164.html\">Webcam Logitech HD C270</a></h2><h2><strong>Học Trực Tuyến Đơn Giản Chỉ Cần Vậy!</strong></h2><p><img src=\"https://anphat.com.vn/media/lib/27-10-2021/logitech_c270_1.jpg\" alt=\"Webcam Logitech HD C270, Logitech C270 - ANPHATPC.COM.VN\"></p><p>&nbsp;</p><h3><strong>SIMPLE HD VIDEO CALLS</strong></h3><p><img src=\"https://anphat.com.vn/media/lib/27-10-2021/logitech_c270_2.jpg\" alt=\"Webcam Logitech HD C270, Logitech C270 - ANPHATPC.COM.VN\"><br><a href=\"https://www.anphatpc.com.vn/webcam-logitech-hd-c270_id18164.html\"><strong>Webcam Logitech HD C270</strong></a><strong>&nbsp;</strong>mang đến cho các bạn những cuộc gọi hội nghị mượt mà nhất và sắc nét nhất lên tới phân giải hiển thị <strong>720p</strong> cùng với tốc độ khung hình <strong>30fps</strong> ở định dạng màn hình góc rộng. Không những thế, nó còn có thể tự động hiệu chỉnh ánh sáng xung quanh không gian môi trường, giúp các bạn thấy được toàn bộ màu sắc tự nhiên, sống động như thật.</p><p>&nbsp;</p><h3><strong>WIDESCREEN HD 720P VIDEO CALLS</strong></h3><p><img src=\"https://anphat.com.vn/media/lib/27-10-2021/logitech_c270_3.jpg\" alt=\"Webcam Logitech HD C270, Logitech C270 - ANPHATPC.COM.VN\"><br>Cuộc gọi ghi hình HD 720p/30fps của chiếc <a href=\"https://www.anphatpc.com.vn/webcam-logitech_dm2226.html\"><strong>Webcam Logitech</strong></a> HD C270 này không những mang đến một khả năng hiển thị sắc nét với trường nhìn theo đường chéo góc <strong>55</strong> độ để tự động điều chỉnh ánh sáng. Mà nó còn tương thích rất tốt với các nền tảng phổ biến hiện nay bao gồm <strong>Facebook</strong>, <strong>Skype</strong>, <strong>Zoom</strong> và <strong>Google Meet</strong>.</p><p>&nbsp;</p><h3><strong>MONO NOISE-REDUCING MIC</strong></h3><p><img src=\"https://anphat.com.vn/media/lib/27-10-2021/logitech_c270_4.jpg\" alt=\"Webcam Logitech HD C270, Logitech C270 - ANPHATPC.COM.VN\"><br>Bộ phận đàm thoại giảm thiểu tiếng ồn tích hợp đảm bảo giọng nói các của bạn phát ra rõ ràng cách xa lên tới 1.5 mét, ngay cả khi các bạn đang ở trong môi trường bận rộn.</p><p>&nbsp;</p><h3><strong>AUTO-LIGHT CORRECTION</strong></h3><p><img src=\"https://anphat.com.vn/media/lib/27-10-2021/logitech_c270_5.jpg\" alt=\"Webcam Logitech HD C270, Logitech C270 - ANPHATPC.COM.VN\"><br>Thêm vào đó, tính năng RightLight 2 của chiếc Webcam Logitech này còn có thể điều chỉnh theo nhiều điều kiện ánh sáng khác nhau, tạo ra hình ảnh tương phản, sáng hơn để giúp các bạn trông đẹp trong tất cả các cuộc gọi hội nghị của mình.</p><p>&nbsp;</p><h3><strong>FIRM MOUNTING OPTION</strong></h3><p><img src=\"https://anphat.com.vn/media/lib/27-10-2021/logitech_c270_6.jpg\" alt=\"Webcam Logitech HD C270, Logitech C270 - ANPHATPC.COM.VN\"><br>Ngoài tất cả những tính năng và thiết kế ở trên thì cấu trúc khung kẹp đa năng của chiếc <a href=\"https://www.anphatpc.com.vn/webcam_dm1181.html\"><strong>Webcam</strong></a> Logitech HD C270 này còn cho phép các bạn điều chỉnh trực tiếp và gắn thẳng máy ảnh một cách chắc chắn vào <a href=\"https://www.anphatpc.com.vn/man-hinh-may-tinh.html-1\"><strong>Màn hình máy tính</strong></a>, <a href=\"https://www.anphatpc.com.vn/may-tinh-xach-tay-laptop.html\"><strong>Máy tính xách tay Laptop</strong></a> của mình hoặc gấp kẹp hay đặt webcam trên giá. Vậy các bạn đã sẵn sàng cho cuộc gọi điện ghi hình (Video) đầu tiên của mình chưa?</p><h3><br><strong>SPECIFICATION</strong></h3><p><strong>DIMENSIONS</strong></p><p><img src=\"https://anphat.com.vn/media/lib/27-10-2021/logitech_c270_7.jpg\" alt=\"Webcam Logitech HD C270, Logitech C270 - ANPHATPC.COM.VN\"><br>Dimensions including fixed mounting clip<br>Height: 72.91 mm<br>Width: 31.91 mm<br>Depth: 66.64 mm<br>Cable length: 1.5 m<br>Weight: 75 g</p><p>&nbsp;</p><p><strong>SYSTEM REQUIREMENTS</strong></p><p><img src=\"https://anphat.com.vn/media/lib/27-10-2021/logitech_c270_8.jpg\" alt=\"Webcam Logitech HD C270, Logitech C270 - ANPHATPC.COM.VN\"><br>Compatible with<br>Windows® 7 or later<br>macOS 10.10 or later<br>Chrome OS™<br>USB - A port<br>Works with popular calling platforms.</p><p>&nbsp;</p><p><strong>TECHNICAL SPECIFICATIONS</strong></p><p><img src=\"https://anphat.com.vn/media/lib/27-10-2021/logitech_c270_9.jpg\" alt=\"Webcam Logitech HD C270, Logitech C270 - ANPHATPC.COM.VN\"><br>Max Resolution: 720p/30fps<br>Camera mega pixel: 0.9<br>Focus type: fixed focus<br>Lens type: plastic<br>Built-in mic: Mono<br>Mic range: Up to 1 m<br>Diagonal field of view (dFoV): 55°<br>Universal mounting clip fits laptops, LCD or monitors</p><p>&nbsp;</p><p><strong>PACKAGE CONTENTS</strong></p><p><img src=\"https://anphat.com.vn/media/lib/27-10-2021/logitech_c270_10.jpg\" alt=\"Webcam Logitech HD C270, Logitech C270 - ANPHATPC.COM.VN\"><br>1 webcam with 1.5 m attached USB - A cable<br>User documentation</p><p><strong>WARRANTY INFORMATION</strong></p><p>2-Year Limited Hardware Warranty</p><p><strong>PART NUMBER</strong></p><p>960-000626</p><p>➤ Nếu bạn có bất kỳ câu hỏi nào về&nbsp;<strong>Webcam Logitech HD C270</strong> hãy để lại câu hỏi ngay bên dưới hoặc liên hệ ngay với đội ngũ chuyên viên tư vấn của <a href=\"https://www.anphatpc.com.vn/\"><strong>An Phát Computer</strong></a> ngay nhé! Chúng tôi sẽ giúp bạn! (Hotline: 1900.0323 phím 6)</p>', 20, 459000, '2024-06-06 08:16:57', '2024-06-07 05:11:48');
INSERT INTO `products` (`id`, `id_category`, `name`, `slug`, `image`, `info`, `des`, `quantity`, `unit_prices`, `created_at`, `updated_at`) VALUES
(8, 4, 'Màn Hình Đồ Họa LG 27UP850N-W (Hàng Giá Sốc)', 'man-hinh-do-hoa-lg-27up850n-w-hang-gia-soc', 'http://127.0.0.1:8000/img/product04.png', '<p>Kiểu dáng màn hình: Phẳng (Màu Trắng)Tỉ lệ khung hình: 16:9Kích thước mặc định: 27.0 inchCông nghệ tấm nền: IPSPhân giải điểm ảnh: 4K - UHD - 3840 x 2160Độ sáng hiển thị: 400 Nits cd/m2Tần số quét màn: 60 Hz (Hertz)Thời gian đáp ứng: 5ms (GTG)Chỉ số màu sắc: 1.07 tỷ màu - sRGB 100% - DCI-P3 95% (Thông Thường) - 10 bits (8 bits + FRC)Hỗ trợ tiêu chuẩn: VESA (100 mm x 100 mm), AMD FreeSync, Dynamic Action Sync, DisplayHDR™ 400, HDR10, Speaker Maxx Audio (5W x 2)Cổng cắm kết nối: 2x HDMI (v2.0), 1x DisplayPort (v1.4), 1x USB-C (Thunderbolt3/PD-90W), 2x USB (v3.0), 1x 3.5mm Audio OutPhụ kiện trong hộp: Dây nguồn, Bộ chuyển đổi nguồn, Dây DP to DP (1m8), Dây USB-C to USB-C (1m), Dây HDMI to HDMI (1m5) **Tất cả dây cáp màu trắng</p>', '<h2><strong>Màn Hình Máy Tính LG 27UP850-W</strong></h2><h2><strong>DÀNH CHO NHỮNG SÁNG TẠO ĐAM MÊ</strong></h2><p>&nbsp;</p><p>Nhắc tới&nbsp;<a href=\"https://www.anphatpc.com.vn/man-hinh-may-tinh.html-1\"><strong>màn hình</strong></a>&nbsp;cao cấp thì mọi người nghĩ ngay tới các sản phẩm&nbsp;<a href=\"https://www.anphatpc.com.vn/man-hinh-may-tinh.html-1\"><strong>màn hình</strong></a>&nbsp;của thương hiệu LG.&nbsp;<a href=\"https://www.anphatpc.com.vn/man-hinh-lg_dm1354.html\"><strong>Màn hình LG</strong></a> này đã không ngừng cải tiến các sản phẩm để mang tới cho người dùng những giá trị tốt nhất, với &nbsp;các công nghệ màn hình tốt nhât hiện nay, với nhiều tỷ lệ màn hình khác nhau.</p><p>Bạn đã được trải nghiệm màn hình 4K UHD của LG chưa? Nếu như Full HD đã quá quen thuộc, phổ thông thì 4K UHD mang tới sự mới mẻ với khả năng hỗ trợ màu sắc và độ sáng vượt trội so với màn hình thông thường, hứa hẹn là công cụ đắc lực cho các nhà thiết kế hình ảnh, video, sáng tạo nội dung và chơi game giải trí.</p><p>Với mức giá hơn 12 triệu đồng, màn hình máy tính <strong>LG 27UP850-W&nbsp;</strong>4K UHD mang tới sự đổi mới giúp tăng năng suất làm việc, giải trí và chơi game của bạn, chắc chắn sẽ không khiên anh em phải thất vọng! Cùng An Phát khám phá em ý nhé!</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/06-04-2021/27up850-w-bv-5.jpg\" alt=\"\"></figure><h2><strong>Cùng tìm hiểu về thiết kế nào!</strong></h2><p><strong>LG </strong>tối giản các chi tiết<strong>&nbsp;</strong>để người dùng có thể dễ dàng lắp đặt nhanh chóng, chính xác hơn. Phần chân đế của màn hình kết nối với màn hình hoàn toàn bằng khớp và nút bấm.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/06-04-2021/sd.png\" alt=\"\"></figure><p>Dù là dòng màn hình máy tính nào của LG thì họ vẫn luôn chú trọng thiết kế viền mỏng 3 cạnh giúp tăng tỉ lệ màn hình trên thân máy, mang tới tới trải hình ảnh chìm đắm hơn rất nhiều. Giúp người dùng sẽ tập trung vào hình ảnh khi làm việc và giải trí hơn.</p><p>Chân đế hình bán nguyệt lạ mắt, tạo điểm nhấn cho tổng thể chiếc màn hình này. Chân đế chắc chắn nhưng với đường cong mềm mại mang tới cảm giác tao nhã, tinh tế. Ngoài thẩm mĩ, chân đế còn được thiết kế khá thông minh khi có khả năng điều chỉnh linh hoạt độ cao, độ nghiêng và Xoay 90° dễ dàng với trục xoay.</p><p>&nbsp; &nbsp;</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/06-04-2021/27up850-w-bv-12.jpg\" alt=\"\"></figure><p>LG đơn giản hoá các cổng kết nối ở mặt lưng, với các cổng kết nối phổ biến hiện nay gồm DisplayPort, HDMI (2 cổng) và USB-C. <a href=\"https://www.anphatpc.com.vn/man-hinh-usb-type-c_dm1877.html\"><strong>Màn hình&nbsp;USB Type-C</strong></a> đặc biệt hơn cả khi cho phép hiển thị video 4K với khung 60fps, truyền dữ liệu và sạc pin cho máy tính xách tay/thiết bị di động, tất cả cùng lúc trên một dây cáp duy nhất. Với cổng USB-C, chúng ta sẽ được trải nghiệm sự tiện lợi khi vừa kết nối màn hình và còn hơn thế nữa.</p><p>Ngoài ra, LG cũng đã &nbsp;sử dụng adapter rời &nbsp;để chiếc màn hình của chúng ta trở nên mỏng và nhẹ hơn.</p><p>&nbsp; &nbsp;</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/06-04-2021/man-hinh-lg-27up850-w-3-songphuongvn_.jpg\" alt=\"\"></figure><h3><strong>Chi tiết về cấu hình</strong></h3><p><strong>Tiêu chuẩn 4K trên</strong> <strong>LG 27UP850-W&nbsp;</strong></p><p><strong>Màn hình 4K&nbsp;</strong>đang được coi là xu hướng công nghê cho các dòng màn hình cao cấp của các thương hiệu lớn như SamSung, Sony, LG,… đã và đang không ngừng phát triển.<strong> 4K</strong>&nbsp;là độ phân giải cao gấp nhiều lần so với độ phân giải màn&nbsp;hình trước đây là&nbsp;<strong>Full HD(1920×1080). </strong>Chính vì vậy có khả năng cho phép bạn trải nghiệm hình ảnh chân thực hơn sống động hơn, khung hình hoàn mỹ hơn ngay cả khi xem ở khoảng cách gần hoặc rất gần.</p><p>&nbsp; &nbsp;</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/06-04-2021/2120_27uk850.png\" alt=\"\"></figure><p><strong>VESA DisplayHDR™ 400</strong></p><p>Màn hình 4K tương thích chuẩn VESA DisplayHDR™ 400, cho màu sắc vượt trội so với màn hình thông thường. Với độ sáng tối đa đạt 400 nits cho hình ảnh nổi bật, chân thực như được tái hiện trước măt bạn.</p><p>&nbsp; &nbsp;&nbsp;</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/06-04-2021/p8-.png\" alt=\"\"></figure><p><strong>sRGB 99%</strong></p><p>Với những người làm đồ họa chuyên nghiệp, chỉnh sửa hình ảnh, video rất cần một chiếc màn hình có chất lượng hình ảnh tốt, màu sắc chính xác rất cao. Chính vì vậy, LG đã sử dụng trên màn hình độ bao phủ màu 99% sRGB hỗ trợ đến 1.07 tỷ màu sắc mang tới khả năng hiện thị màu sắc chính xác cao vượt trội.</p><p>&nbsp; &nbsp; &nbsp;&nbsp;</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/06-04-2021/4.png\" alt=\"\"></figure><p><strong>Tốc độ làm mới: 60Hz và Thời gian đáp ứng: 5ms</strong></p><p>Tốc độ làm mới và thời gian đáp ứng có thông số khá phổ thông, không phải suất sắc<strong> Thời gian đáp ứng: 5msTốc độ làm mới: 60HzThời gian đáp ứng: 5ms</strong>nếu bạn muốn chơi những game yêu cầu tốc độ cực nhanh. Nhưng với nhu cầu duyệt web, soạn văn bản hay chỉnh sửa ảnh, độ trễ giữa các màu sắc thay đổi trên màn hình là rất nhanh thì <strong>60Hz &nbsp;và 5ms</strong> là những thông số rất chuẩn.</p><p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/06-04-2021/27up850-w-bv-10.jpg\" alt=\"\"></figure><h2><strong>Các công nghệ&nbsp;được tích hợp</strong></h2><p><strong>Radeon FreeSync</strong></p><p><strong>LG 27UP850-W&nbsp;</strong> được tích hợp sẵn công nghệ <strong>Radeon FreeSync, </strong>cho phép tốc độ làm mới màn hình đồng bộ hóa với tốc độ khung hình của trò chơi. Đây là công nghệ thường được trang bị trên màn hìnhgiúp ngăn chặn các hiện tượng như rách hình, hạn chế tối đa độ trễ đầu vào trong khi chơi game và phát video.</p><p>Màn hình 60Hz chỉ thực hiện được 60 khung hình/giây và đầu ra GPU của bạn giảm xuống, lúc này tốc độ làm mới sẽ tự động khớp với màn hình khi FreeSync được bật.</p><p>&nbsp; &nbsp;&nbsp;</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/06-04-2021/f.png\" alt=\"\"></figure><p><strong>Dynamic Action Sync</strong></p><p>&nbsp;Nếu chỉ FreeSync là chưa đủ, thì LG cũng đã tích hợp thêm công nghệ <strong>Dynamic Action Sync </strong>giúp Game thủ có thể trải nghiệm mượt mà các trò chơi ở tốc độ cao hơn, các game RTS nhờ tối ưu hóa hơn với tính năng Đồng bộ hành động động, giảm thiểu độ trễ đầu vào.</p><p>&nbsp; &nbsp; &nbsp;</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/06-04-2021/ytry.png\" alt=\"\"></figure><p><strong>Cân bằng tối</strong></p><p>Còn với khả năng cân bằng sáng tối mang tới lợi thế lớn khi chơi game cho các game thủ khi người chơi game có thể tránh các tay súng bắn tỉa trốn ở những nơi tối nhất và nhanh chóng thoát khỏi tình huống nguy hiểm.</p><p>Nếu dùng thử với các tựa game như FPS, tính năng này sẽ<strong>&nbsp;</strong>phát huy rõ rệt, game thủ dễ dàng phản ứng nhanh hơn, đây chính là lợi thế để chiến thắng.</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/06-04-2021/lll.png\" alt=\"\"></figure><p>Ngoài ra, màn hình còn có các chế độ chơi game khác nhau: Cho phép điều chỉnh màu sắc hình ảnh cho phù hợp với từng tựa game FPS, RTS, Custom…</p><p><strong>Trình điều khiển màn hình</strong></p><p>Không cần phải điều chỉnh bằng các nút cứng trên màn hình, giờ đây bạn chỉ cần vài cú nhấp chuột là có thể điều chỉnh: Âm lượng, độ sáng, đặt sẵn chế độ hình ảnh, chế độ màn hình 2.0 và bộ điều khiển kép và nhiều cài đặt khác. Sự tiện ích này là nhờ trình điều khiển màn hình đã đưa nhiều cài đặt màn hình thiết yếu vào 1 cửa sổ.</p><p>&nbsp; &nbsp;&nbsp;</p><figure class=\"image\"><img src=\"https://anphat.com.vn/media/lib/06-04-2021/yuyu.png\" alt=\"\"></figure><p><strong>Tương thích chuẩn HDCP 2.2</strong></p><p>Có thể phát video từ dịch vụ trực tuyến 4K, máy chơi game và đầu đĩa Blu-ray Ultra HD do màn hình này có tương thích với khả năng bảo vệ chống sao chép HDCP 2.2</p><p>&nbsp;</p><p><strong>Bảo hành tận nhà</strong></p><p>Dịch vụ bảo hành tại nhà chắc chắn sẽ khiến khách hàng hài lòng, áp dụng với các sản phẩm màn hình máy tính và laptop mang thương hiệu LG được nhập khẩu và phân phối chính thức tại thị trường Việt Nam.</p><p><strong>Hotline: 1800 1503</strong></p><p>&nbsp;<strong>&nbsp;&nbsp;</strong></p><figure class=\"image\"><img src=\"https://www.anphatpc.com.vn/media/lib/32911_27QN600-10.jpg\" alt=\"\"></figure><p>&nbsp;</p><p>&nbsp;</p><p>Nếu bạn có bất kỳ câu hỏi nào về&nbsp;những chiếc&nbsp;<strong>Màn hình&nbsp;LG 27UP850-W</strong>&nbsp;hãy để lại câu hỏi ngay bên dưới hoặc liên hệ ngay với đội ngũ chuyên viên tư vấn của&nbsp;An Phát Computer&nbsp;ngay nhé! Chúng tôi sẽ giúp bạn! (Hotline: 1900.0323 phím 6)</p>', 20, 7799000, '2024-06-06 08:18:15', '2024-06-06 08:18:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','customer') NOT NULL DEFAULT 'customer',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nguyen Van Huynh', 'vanhuynh272001@gmail.com', NULL, '$2y$10$38tIaqfIoL6XDeUtNvpL5OAV6tmc7fhpCq/k92ehQ39em7MzdOsvi', 'admin', 'active', NULL, '2024-06-05 07:07:55', '2024-06-05 07:07:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_id_product_foreign` (`id_product`),
  ADD KEY `items_id_order_foreign` (`id_order`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_id_user_foreign` (`id_user`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_category_foreign` (`id_category`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_id_order_foreign` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `items_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_category_foreign` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
