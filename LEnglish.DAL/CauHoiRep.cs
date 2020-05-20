using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.DAL;
using System.Linq;

namespace LEnglish.DAL
{
    using LEnglish.DAL.Models;
    public class CauHoiRep: GenericRep<LEnglishDBContext, CauHoi>
    {
        #region --Overrides--
        public override CauHoi Read(string code)
        {
            var res = All.FirstOrDefault(p => p.MaCauHoi == code);
            return res;
        }
        #endregion
        public string Remove(string code)
        {
            var m = base.All.First(i => i.MaCauHoi == code);
            m = base.Delete(m);
            return m.MaCauHoi;
        }
    }
}
