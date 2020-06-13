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

    public class BaiTapSvc : GenericSvc<BaiTapRep, BaiTap>
    {
        public override SingleRsp Read(string code)
        {
            var res = new SingleRsp();

            var m = _rep.Read(code);
            res.Data = m;

            return res;
        }

        public override SingleRsp Update(BaiTap m)
        {
            var res = new SingleRsp();

            var m1 = m.MaBaiTap != null ? _rep.Read(m.MaBaiTap) : _rep.Read(m.MoTa);
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

        public SingleRsp CreateBaiTap(BaiTapReq baitap)
        {
            var res = new SingleRsp();
            BaiTap bt = new BaiTap();
            bt.MaBaiTap = baitap.MaBaiTap;
            bt.TenBaiTap = baitap.TenBaiTap;
            bt.NoiDung = baitap.NoiDung;
            bt.DanhMuc = baitap.DanhMuc;
            bt.MoTa = baitap.MoTa;
            bt.GhiChu = baitap.GhiChu;

            res = _rep.CreateBaiTap(bt);

            return res;
        }

        public SingleRsp UpdateBaiTap(BaiTapReq baitap)
        {
            var res = new SingleRsp();
            BaiTap bt = new BaiTap();
            bt.MaBaiTap = baitap.MaBaiTap;
            bt.TenBaiTap = baitap.TenBaiTap;
            bt.NoiDung = baitap.NoiDung;
            bt.DanhMuc = baitap.DanhMuc;
            bt.MoTa = baitap.MoTa;
            bt.GhiChu = baitap.GhiChu;

            res = _rep.UpdateBaiTap(bt);

            return res;
        }

        public SingleRsp RemoveBaiTap(string code)
        {
            var res = new SingleRsp();

            var m = _rep.Read(code);

            res = _rep.RemoveBaiTap(m);

            return res;
        }

        public object SearchBaiTap(string keyword, int page, int size)
        {
            var bt = All.Where(x => x.MaBaiTap.Contains(keyword)).Union(All.Where(x => x.TenBaiTap.Contains(keyword)));

            var offset = (page - 1) * size;
            var total = bt.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = bt.OrderBy(x => x.TenBaiTap).Skip(offset).Take(size).ToList();

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
