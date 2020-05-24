using System;
using System.Collections.Generic;
using System.Text;

using LEnglish.Common.DAL;
using System.Linq;

namespace LEnglish.DAL
{
    using LEnglish.Common.Rsp;
    using LEnglish.DAL.Models;
    public class NguoiDungRep :GenericRep<LEnglishDBContext, NguoiDung>
    {
        #region --Overrides--
        public override NguoiDung Read(int id)
        {
            var res = All.FirstOrDefault(p => p.MaNguoiDung == id);
            return res;
        }
        #endregion
        public int Remove(int id)
        {
            var m = base.All.First(i => i.MaNguoiDung == id);
            m = base.Delete(m);
            return m.MaNguoiDung;
        }

        #region --Methods--

        public SingleRsp CreateNguoiDung(NguoiDung nguoidung)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.NguoiDung.Add(nguoidung);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch(Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }

        public SingleRsp UpdateNguoiDung(NguoiDung nguoidung)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.NguoiDung.Update(nguoidung);
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

        public SingleRsp RemoveNguoiDung(NguoiDung nguoidung)
        {
            var res = new SingleRsp();
            using (var context = new LEnglishDBContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.NguoiDung.Remove(nguoidung);
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
