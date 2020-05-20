using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.DAL;
using System.Linq;

namespace LEnglish.DAL
{
    using LEnglish.DAL.Models;
    public class CapBacRep: GenericRep<LEnglishDBContext, CapBac>
    {
        #region --Overrides--
        public override CapBac Read(string code)
        {
            var res = All.FirstOrDefault(p => p.MaCapBac == code);
            return res;
        }
        #endregion
        public string Remove(string code)
        {
            var m = base.All.First(i => i.MaCapBac == code);
            m = base.Delete(m);
            return m.MaCapBac;
        }
    }
}
