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

    public class DanhMucSvc : GenericSvc<DanhMucRep, DanhMuc>
    {
        public override SingleRsp Read(string code)
        {
            var res = new SingleRsp();

            var m = _rep.Read(code);
            res.Data = m;

            return res;
        }

        public override SingleRsp Update(DanhMuc m)
        {
            var res = new SingleRsp();

            var m1 = m.MaDanhMuc != null ? _rep.Read(m.MaDanhMuc) : _rep.Read(m.MoTa);
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

        public SingleRsp CreateDanhMuc(DanhMucReq danhmuc)
        {
            var res = new SingleRsp();
            DanhMuc dm = new DanhMuc();
            dm.MaDanhMuc = danhmuc.MaDanhMuc;
            dm.TenDanhMuc = danhmuc.TenDanhMuc;
            dm.CapBac = danhmuc.CapBac;
            dm.MoTa = danhmuc.MoTa;
            dm.GhiChu = danhmuc.GhiChu;
            res = _rep.CreateDanhMuc(dm);

            return res;
        }

        public SingleRsp UpdateDanhMuc(DanhMucReq danhmuc)
        {
            var res = new SingleRsp();
            DanhMuc dm = new DanhMuc();
            dm.MaDanhMuc = danhmuc.MaDanhMuc;
            dm.TenDanhMuc = danhmuc.TenDanhMuc;
            dm.CapBac = danhmuc.CapBac;
            dm.MoTa = danhmuc.MoTa;
            dm.GhiChu = danhmuc.GhiChu;
            res = _rep.UpdateDanhMuc(dm);

            return res;
        }

        public SingleRsp RemoveDanhMuc(string code)
        {
            var res = new SingleRsp();

            var m = _rep.Read(code);

            res = _rep.RemoveDanhMuc(m);

            return res;
        }

        public object SearchDanhMuc(string keyword, int page, int size)
        {
            var dm = All.Where(x => x.TenDanhMuc.Contains(keyword)).Union(All.Where(x => x.MaDanhMuc.Contains(keyword)));

            var offset = (page - 1) * size;
            var total = dm.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = dm.OrderBy(x => x.TenDanhMuc).Skip(offset).Take(size).ToList();

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
