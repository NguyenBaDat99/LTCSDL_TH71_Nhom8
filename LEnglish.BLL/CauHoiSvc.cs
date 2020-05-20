using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.Rsp;
using LEnglish.Common.BLL;

namespace LEnglish.BLL
{
    using DAL;
    using DAL.Models;
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
    }
}
