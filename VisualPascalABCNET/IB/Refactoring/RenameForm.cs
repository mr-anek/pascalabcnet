﻿

using System;
using System.Drawing;
using System.Windows.Forms;

namespace VisualPascalABC
{
	/// <summary>
	/// Description of RenameForm.
	/// </summary>
	public partial class RenameForm : Form
	{
		public RenameForm()
		{
			//
			// The InitializeComponent() call is required for Windows Forms designer support.
			//
			InitializeComponent();
			
			//
			// TODO: Add constructor code after the InitializeComponent() call.
			//
		}
		
		public string EditValue
		{
			get
			{
				return this.tbName.Text;
			}
			set
			{
				this.tbName.Text = value;
				this.tbName.Select();
			}
		}
	}
}