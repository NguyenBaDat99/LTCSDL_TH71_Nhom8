using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.DAL;
using System.Linq;

namespace LEnglish.DAL
{
    using LEnglish.Common.Rsp;
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

        #region --Methods--

        public SingleRsp CreateBangDiem(BangDiem bangdiem)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.BangDiem.Add(bangdiem);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }

        public SingleRsp UpdateBangDiem(BangDiem bangdiem)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.BangDiem.Update(bangdiem);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }

        public SingleRsp RemoveBangDiem(BangDiem bangdiem)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.BangDiem.Remove(bangdiem);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }
        #endregion
    }
}
