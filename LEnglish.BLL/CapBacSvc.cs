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

    public class CapBacSvc: GenericSvc<CapBacRep, CapBac>
    {
        public override SingleRsp Read(string code)
        {
            var res = new SingleRsp();

            var m = _rep.Read(code);
            res.Data = m;

            return res;
        }

        public override SingleRsp Update(CapBac m)
        {
            var res = new SingleRsp();

            var m1 = m.MaCapBac != null ? _rep.Read(m.MaCapBac) : _rep.Read(m.MoTa);
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

        public SingleRsp CreateCapBac(CapBacReq capBac)
        {
            var res = new SingleRsp();
            CapBac cb = new CapBac();
            cb.MaCapBac = capBac.MaCapBac;
            cb.TenCapBac = capBac.TenCapBac;
            cb.MoTa = capBac.MoTa;
            cb.GhiChu = capBac.GhiChu;
            res = _rep.CreateCapBac(cb);

            return res;
        }

        public SingleRsp UpdateCapBac(CapBacReq capBac)
        {
            var res = new SingleRsp();
            CapBac cb = new CapBac();
            cb.MaCapBac = capBac.MaCapBac;
            cb.TenCapBac = capBac.TenCapBac;
            cb.MoTa = capBac.MoTa;
            cb.GhiChu = capBac.GhiChu;
            res = _rep.UpdateCapBac(cb);

            return res;
        }

        public SingleRsp RemoveCapBac(string code)
        {
            var res = new SingleRsp();

            var m = _rep.Read(code);

            res = _rep.RemoveCapBac(m);

            return res;
        }

        public object SearchCapBac(string keyword, int page, int size)
        {
            var cb = All.Where(x => x.TenCapBac.Contains(keyword)).Union(All.Where(x => x.MaCapBac.Contains(keyword)));

            var offset = (page - 1) * size;
            var total = cb.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = cb.OrderBy(x => x.TenCapBac).Skip(offset).Take(size).ToList();

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
    }
}
