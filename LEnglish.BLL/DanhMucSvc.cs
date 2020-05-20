using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.Rsp;
using LEnglish.Common.BLL;

namespace LEnglish.BLL
{
    using DAL;
    using DAL.Models;
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
    }
}
