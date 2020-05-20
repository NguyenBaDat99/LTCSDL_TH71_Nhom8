using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.DAL;
using System.Linq;

namespace LEnglish.DAL
{
    using LEnglish.DAL.Models;
    public class BangDiemRep: GenericRep<LEnglishDBContext, BangDiem>
    {
        #region --Overrides--
        public override BangDiem Read(int id)
        {
            var res = All.FirstOrDefault(p => p.MaBangDiem == id);
            return res;
        }
        #endregion
        public int Remove(int id)
        {
            var m = base.All.First(i => i.MaBangDiem == id);
            m = base.Delete(m);
            return m.MaBangDiem;
        }
    }
}
