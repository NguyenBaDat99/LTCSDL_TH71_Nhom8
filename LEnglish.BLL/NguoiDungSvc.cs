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

    public class NguoiDungSvc: GenericSvc<NguoiDungRep, NguoiDung>
    {
        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();

            var m = _rep.Read(id);
            res.Data = m;

            return res;
        }

        public override SingleRsp Update(NguoiDung m)
        {
            var res = new SingleRsp();

            var m1 = m.MaNguoiDung > 0 ? _rep.Read(m.MaNguoiDung) : _rep.Read(m.TenNguoiDung);
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

        public SingleRsp CreateNguoiDung(NguoiDungReq nguoidung)
        {
            var res = new SingleRsp();
            NguoiDung ng = new NguoiDung();
            ng.MaNguoiDung = nguoidung.MaNguoiDung;
            ng.TenDangNhap = nguoidung.TenDangNhap;
            ng.MatKhau = nguoidung.MatKhau;
            ng.TenNguoiDung = nguoidung.TenNguoiDung;
            ng.GioiTinh = nguoidung.GioiTinh;
            ng.NgaySinh = nguoidung.NgaySinh;
            ng.Email = nguoidung.Email;
            res = _rep.CreateNguoiDung(ng);

            return res;
        }

        public SingleRsp UpdateNguoiDung(NguoiDungReq nguoidung)
        {
            var res = new SingleRsp();
            NguoiDung ng = new NguoiDung();
            ng.MaNguoiDung = nguoidung.MaNguoiDung;
            ng.TenDangNhap = nguoidung.TenDangNhap;
            ng.MatKhau = nguoidung.MatKhau;
            ng.TenNguoiDung = nguoidung.TenNguoiDung;
            ng.GioiTinh = nguoidung.GioiTinh;
            ng.NgaySinh = nguoidung.NgaySinh;
            ng.Email = nguoidung.Email;
            res = _rep.UpdateNguoiDung(ng);

            return res;
        }

        public SingleRsp RemoveNguoiDung(int id)
        {
            var res = new SingleRsp();

            var m = _rep.Read(id);

            res = _rep.RemoveNguoiDung(m);

            return res;
        }

        public object SearchNguoiDung(string keyword, int page, int size)
        {
            var ng = All.Where(x => x.TenNguoiDung.Contains(keyword));

            var offset = (page - 1) * size;
            var total = ng.Count();
            int totalPage = (total % size) == 0 ? (int) (total / size) : (int) ((total / size) + 1);
            var data = ng.OrderBy(x => x.TenNguoiDung).Skip(offset).Take(size).ToList();

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
