using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.DAL;
using System.Linq;

namespace LEnglish.DAL
{
    using LEnglish.DAL.Models;
    public class DanhMucRep: GenericRep<LEnglishDBContext, DanhMuc>
    {
        #region --Overrides--
        public override DanhMuc Read(string code)
        {
            var res = All.FirstOrDefault(p => p.MaDanhMuc == code);
            return res;
        }
        #endregion
        public string Remove(string code)
        {
            var m = base.All.First(i => i.MaDanhMuc == code);
            m = base.Delete(m);
            return m.MaDanhMuc;
        }
    }
}
