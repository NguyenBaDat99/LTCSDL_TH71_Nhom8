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

    public class CauHoiSvc: GenericSvc<CauHoiRep, CauHoi>
    {
        public override SingleRsp Read(string code)
        {
            var res = new SingleRsp();

            var m = _rep.Read(code);
            res.Data = m;

            return res;
        }

        public override SingleRsp Update(CauHoi m)
        {
            var res = new SingleRsp();

            var m1 = m.MaCauHoi != null ? _rep.Read(m.MaCauHoi) : _rep.Read(m.GhiChu);
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

        public SingleRsp CreateCauHoi(CauHoiReq cauhoi)
        {
            var res = new SingleRsp();
            CauHoi ch = new CauHoi();
            ch.MaCauHoi = cauhoi.MaCauHoi;
            ch.NoiDungCauHoi = cauhoi.NoiDungCauHoi;
            ch.CauTraLoi = cauhoi.CauTraLoi;
            ch.DapAn = cauhoi.DapAn;
            ch.BaiTap = cauhoi.BaiTap;
            ch.GhiChu = cauhoi.GhiChu;
            res = _rep.CreateCauHoi(ch);

            return res;
        }

        public SingleRsp UpdateCauHoi(CauHoiReq cauhoi)
        {
            var res = new SingleRsp();
            CauHoi ch = new CauHoi();
            ch.MaCauHoi = cauhoi.MaCauHoi;
            ch.NoiDungCauHoi = cauhoi.NoiDungCauHoi;
            ch.CauTraLoi = cauhoi.CauTraLoi;
            ch.DapAn = cauhoi.DapAn;
            ch.BaiTap = cauhoi.BaiTap;
            ch.GhiChu = cauhoi.GhiChu;
            res = _rep.UpdateCauHoi(ch);

            return res;
        }

        public SingleRsp RemoveCauHoi(string code)
        {
            var res = new SingleRsp();

            var m = _rep.Read(code);

            res = _rep.RemoveCauHoi(m);

            return res;
        }

        public object SearchCauHoi(string keyword, int page, int size)
        {
            var ch = All.Where(x => x.MaCauHoi.Contains(keyword));

            var offset = (page - 1) * size;
            var total = ch.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = ch.OrderBy(x => x.MaCauHoi).Skip(offset).Take(size).ToList();

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

        public List<object> pro_layDanhSachCauHoi(string keyword)
        {
            return _rep.pro_layDanhSachCauHoi(keyword);
        }
    }
}
