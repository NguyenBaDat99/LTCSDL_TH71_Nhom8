using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.Rsp;
using LEnglish.Common.BLL;

namespace LEnglish.BLL
{
    using DAL;
    using DAL.Models;
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
    }
}
