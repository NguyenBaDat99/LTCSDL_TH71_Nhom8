using System;
using System.Collections.Generic;
using System.Text;

namespace LEnglish.Common.Req
{
    public class BangDiemReq
    {
        public int MaBangDiem { get; set; }
        public string MaBaiTap { get; set; }
        public string TenDangNhap { get; set; }
        public int? SoCauHoi { get; set; }
        public int? SoCauDung { get; set; }
        public double? Diem { get; set; }
        public string TinhTrang { get; set; }
        public string GhiChu { get; set; }
    }
}
