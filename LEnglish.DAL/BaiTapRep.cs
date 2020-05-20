using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.DAL;
using System.Linq;

namespace LEnglish.DAL
{
    using LEnglish.DAL.Models;
    public class BaiTapRep: GenericRep<LEnglishDBContext, BaiTap>
    {
        #region --Overrides--
        public override BaiTap Read(string code)
        {
            var res = All.FirstOrDefault(p => p.MaBaiTap == code);
            return res;
        }
        #endregion
        public string Remove(string code)
        {
            var m = base.All.First(i => i.MaBaiTap == code);
            m = base.Delete(m);
            return m.MaBaiTap;
        }
    }
}
