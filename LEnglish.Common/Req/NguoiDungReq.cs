using System;
using System.Collections.Generic;
using System.Text;

namespace LEnglish.Common.Req
{
    public class NguoiDungReq
    {
        public int MaNguoiDung { get; set; }
        public string TenDangNhap { get; set; }
        public string MatKhau { get; set; }
        public string TenNguoiDung { get; set; }
        public string GioiTinh { get; set; }
        public DateTime? NgaySinh { get; set; }
        public string Email { get; set; }
    }
}
