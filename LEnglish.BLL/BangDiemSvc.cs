using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.Rsp;
using LEnglish.Common.BLL;

namespace LEnglish.BLL
{
    using DAL;
    using DAL.Models;
    using LEnglish.Common.Req;
    using System.Linq;

    public class BangDiemSvc : GenericSvc<BangDiemRep, BangDiem>
    {
        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();

            var m = _rep.Read(id);
            res.Data = m;

            return res;
        }

        public override SingleRsp Update(BangDiem m)
        {
            var res = new SingleRsp();

            var m1 = m.MaBangDiem > 0 ? _rep.Read(m.MaBangDiem) : _rep.Read(m.GhiChu);
            if (m1 == null)
            {
                res.SetError("EZ103", "No data.");
            }
            else
            {
                res = base.Update(m);
                res.Data = m;
            }
            return res;
        }

        public SingleRsp CreateBangDiem(BangDiemReq bangdiem)
        {
            var res = new SingleRsp();
            BangDiem bd = new BangDiem();
            bd.MaBangDiem = bangdiem.MaBangDiem;
            bd.MaBaiTap = bangdiem.MaBaiTap;
            bd.TenDangNhap = bangdiem.TenDangNhap;
            bd.SoCauHoi = bangdiem.SoCauHoi;
            bd.SoCauDung = bangdiem.SoCauDung;
            bd.Diem = bangdiem.Diem;
            bd.TinhTrang = bangdiem.TinhTrang;
            bd.GhiChu = bangdiem.GhiChu;
            res = _rep.CreateBangDiem(bd);

            return res;
        }

        public SingleRsp UpdateBangDiem(BangDiemReq bangdiem)
        {
            var res = new SingleRsp();
            BangDiem bd = new BangDiem();
            bd.MaBangDiem = bangdiem.MaBangDiem;
            bd.MaBaiTap = bangdiem.MaBaiTap;
            bd.TenDangNhap = bangdiem.TenDangNhap;
            bd.SoCauHoi = bangdiem.SoCauHoi;
            bd.SoCauDung = bangdiem.SoCauDung;
            bd.Diem = bangdiem.Diem;
            bd.TinhTrang = bangdiem.TinhTrang;
            bd.GhiChu = bangdiem.GhiChu;
            res = _rep.UpdateBangDiem(bd);

            return res;
        }

        public SingleRsp RemoveBangDiem(int id)
        {
            var res = new SingleRsp();

            var m = _rep.Read(id);

            res = _rep.RemoveBangDiem(m);

            return res;
        }

        public object SearchBangDiem(string keyword, int page, int size)
        {
            var bd = All.Where(x => x.TenDangNhap.Contains(keyword));

            var offset = (page - 1) * size;
            var total = bd.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = bd.OrderBy(x => x.MaBangDiem).Skip(offset).Take(size).ToList();

            var res = new
            {
                Data = data,
                TotalRecord = total,
                TotalPage = totalPage,
                Page = page,
                Size = size
            };
            return res;
        }

        public object SearchBangDiemCaNhan(string keyword)
        {
            var res = All.Where(x => x.TenDangNhap.Contains(keyword));
            return res;
        }
    }
}
